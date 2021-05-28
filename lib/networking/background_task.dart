import 'package:background_fetch/background_fetch.dart';
import 'package:fact_watch/functionalities.dart';
import 'package:fact_watch/News.dart';
import 'package:fact_watch/networking/networking.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:fact_watch/NotificationPlugin.dart';

class BackgroundTask {
  static bool isForeground = true;
  static NotificationPlugin plugin = NotificationPlugin();
  static Future<void> showNotificationWithAttachment(News news) async {
    plugin.showNotificationWithAttachment(news);
  }

  // static _downloadAndSaveFile(String url, String fileName) async {
  //   var directory = await getApplicationDocumentsDirectory();
  //   var filePath = '${directory.path}/$fileName';
  //   var response = await http.get(url);
  //   var file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //   return filePath;
  // }

  static void backgroundFetchHeadlessTask(HeadlessTask task) async {
    String taskId = task.taskId;
    bool timeout = task.timeout;
    if (timeout) {
      print("[BackgroundFetch] Headless task timed-out: $taskId");
      BackgroundFetch.finish(taskId);
      return;
    }

    bool firstRun = await Functionalities.checkFirstRun();

    if (firstRun == false && isForeground == false) {
      try {
        List<News> unnotifiedNews = await getUnnotifiedNews();
        for (News singleNews in unnotifiedNews) {
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
          showNotificationWithAttachment(singleNews);
        }
      } catch (e) {
        print(e);
      }
    }
    if (taskId == 'fact_watch_api') {
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "fact_watch_api",
          delay: 60000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          startOnBoot: true,
          requiresNetworkConnectivity: true,
          requiredNetworkType: NetworkType.ANY,
          enableHeadless: true));
    }
    BackgroundFetch.finish(taskId);
  }

  static Future<void> initPlatformState() async {
    // Load persisted fetch events from SharedPreferences

    // Configure BackgroundFetch.
    try {
      int status = await BackgroundFetch.configure(
          BackgroundFetchConfig(
            minimumFetchInterval: 15,
            forceAlarmManager: false,
            stopOnTerminate: false,
            startOnBoot: true,
            enableHeadless: true,
            requiresBatteryNotLow: false,
            requiresCharging: false,
            requiresStorageNotLow: false,
            requiresDeviceIdle: false,
            requiredNetworkType: NetworkType.NONE,
          ),
          _onBackgroundFetch,
          _onBackgroundFetchTimeout);

      // Schedule a "one-shot" custom-task in 10000ms.
      // These are fairly reliable on Android (particularly with forceAlarmManager) but not iOS,
      // where device must be powered (and delay will be throttled by the OS).
      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "fact_watch_api",
          delay: 60000,
          periodic: true,
          startOnBoot: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          enableHeadless: true));
    } catch (e) {}

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    //if (!mounted) return;
  }

  static Future selectNotification(String payload) async {
    if (payload != null) {}
    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  static void _onBackgroundFetch(String taskId) async {
    bool firstRun = await Functionalities.checkFirstRun();

    if (firstRun == false && isForeground == false) {
      try {
        List<News> unnotifiedNews = await getUnnotifiedNews();
        for (News singleNews in unnotifiedNews) {
          //const id = DateTime.now();
          showNotificationWithAttachment(singleNews);
        }
      } catch (e) {
        print(e);
      }
    }
    if (taskId == "fact_watch_api") {
      // Schedule a one-shot task when fetch event received (for testing).

      BackgroundFetch.scheduleTask(TaskConfig(
          taskId: "fact_watch_api",
          delay: 60000,
          periodic: true,
          forceAlarmManager: true,
          stopOnTerminate: false,
          enableHeadless: true,
          requiresNetworkConnectivity: true,
          requiredNetworkType: NetworkType.ANY,
          requiresCharging: true));
    }
    // IMPORTANT:  You must signal completion of your fetch task or the OS can punish your app
    // for taking too long in the background.
    BackgroundFetch.finish(taskId);
  }

  /// This event fires shortly before your task is about to timeout.  You must finish any outstanding work and call BackgroundFetch.finish(taskId).
  static void _onBackgroundFetchTimeout(String taskId) {
    print("[BackgroundFetch] TIMEOUT: $taskId");
    BackgroundFetch.finish(taskId);
  }

  static Future<List<News>> getUnnotifiedNews() async {
    Functionalities.allNews.clear();
    var newsIds = await NetworkHelper(
            'https://www.fact-watch.org/web/wp-json/wp/v2/posts?per_page=100&_fields=id')
        .getData();
    int? lastId = await Functionalities.getLastNewsId();
    String query = "";

    for (var id in newsIds) {
      if (id['id'] == lastId) break;
      query += "include[]=${id['id']}&";
    }
    var tagObjsJson =
        jsonDecode(await Functionalities.getInitialContent()) as List;
    //List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    List<News> previousNews = tagObjsJson.map((e) => News.fromJson(e)).toList();

    if (query != "") {
      List<News> allNewNews = [];
      var newNews = await NetworkHelper(
              'https://www.fact-watch.org/web/wp-json/wp/v2/posts?${query}_fields=id,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
          .getData();
      for (var singleNews in newNews) {
        int id;
        String title, excerpt, date;
        String content = singleNews['content']['rendered'].toString();
        content = content.replaceAll('<p>&nbsp;</p>', "");
        id = singleNews['id'];
        date = singleNews['date']
            .toString()
            .substring(0, singleNews['date'].toString().indexOf('T'));
        date = new DateFormat("MMMM d, yyyy").format(DateTime.parse(date));
        content = content.replaceAll(date, "").replaceAll("Published on:", "");
        title = singleNews['title']['rendered'];
        excerpt = singleNews['excerpt']['rendered']
            .toString()
            .replaceAll("<p>", "")
            .replaceAll("&hellip; </p>", "...");
        String categories = singleNews['categories'].toString();
        print(categories);
        var thumbnail, mediumLarge;
        try {
          thumbnail = singleNews['_embedded']['wp:featuredmedia'][0]
              ['media_details']['sizes']['medium']['source_url'];
          mediumLarge = singleNews['_embedded']['wp:featuredmedia'][0]
              ['media_details']['sizes']['medium_large']['source_url'];
        } catch (e) {
          print(e);
        }
        allNewNews.add(News(id: id, title: title, excerpt: excerpt, mediaLinkLarge: mediumLarge, thumbnail: thumbnail, date: date,
           description:  content, categories: categories,fav: false));
        Functionalities.allNews.add(News(id: id, title: title, excerpt: excerpt, mediaLinkLarge: mediumLarge, thumbnail: thumbnail, date: date,
            description:  content, categories: categories,fav: false));
      }
      Functionalities.allNews.addAll(previousNews);
      // print(Functionalities.allNews.toString());
      Functionalities.saveLastNewsId(Functionalities.allNews[0].id);
      Functionalities.writeInitialContent(Functionalities.allNews);
      Functionalities.mapNews();
      return allNewNews;
    }

    return [];
  }
}
