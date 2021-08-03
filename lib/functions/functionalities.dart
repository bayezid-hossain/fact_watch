import 'dart:io';

import 'package:fact_watch/models/User.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../models/News.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../networking/networking.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../views/favoriteList.dart';

class Functionalities {
  static String currentRoute = "HomePage";
  static bool commentLoading=false;
  static String previousRoute = "null";
  static User user=new User(website: "",name: "",email: "");
  static List<News> allNews = [];
  static List<News> videos = [];
  static Map<int, News> newsMap = {};
  static Map<int, String> categories = {};
  static String initialContent = "";
  static FavoriteList favoriteNews = FavoriteList();
  static String urlToSite="https://dev.factwatch.org/wp-json/wp/v2/";
  static saveLastNewsId(int id) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt("lastId", id);
  }

  static mapNews() async {
    newsMap.clear();
    for (News news in allNews) {
      newsMap[news.id] = news;
    }
  }

  static List<News> getNewsByCategory(int id) {
    List<News> categorizedNews = [];
    for (News news in allNews) {
      if (news.categories.contains(id.toString())) categorizedNews.add(news);
    }

    return categorizedNews;
  }
  static getOfflineNews()async{

    var tagObjsJson = jsonDecode(initialContent) as List;
    //List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    List<News> previousNews = tagObjsJson.map((e) => News.fromJson(e)).toList();
    Functionalities.allNews.addAll(previousNews);
    allNews.toSet().toList(growable: true);
    mapNews();
    List<int> favs = await loadFavorites();

    favs.forEach((element) {
      favoriteNews.favoriteNews.add(element);
    });

    Functionalities.categories[252] = "আইন-আদালত";
    Functionalities.categories[253] = "তথ্য যাচাই";
    Functionalities.categories[255] =  "জন উদ্যোগ";
    Functionalities.categories[259] = "লেখাজোখা";
    Functionalities.categories[261] = "তথ্য যাচাই";
    Functionalities.categories[265] =  "জনস্বাস্থ্য";
    Functionalities.categories[266] = "বিজ্ঞান ও পরিবেশ";
    Functionalities.categories[271] =  "করোনা তথ্য যাচাই";
    Functionalities.categories[273] = "জরুরি পরামর্শ";
    Functionalities.categories[276] = "ফ্যাক্টওয়াচ ভিডিও";
    Functionalities.categories[277] = "বিজ্ঞাপন যাচাই";
    Functionalities.categories[278] = "স্বাস্থ্য";
    Functionalities.categories[280] = "বাংলাদেশ";
    Functionalities.categories[282] =  "করোনা মহামারি";
    Functionalities.categories[283] = "ফ্যাক্ট ফাইল";
    // print(Functionalities.allNews.toString());

  }
  static getSelectedNews() async {
    var newsIds = await NetworkHelper(
            '${urlToSite}posts?per_page=100&_fields=id')
        .getData();
    int? lastId = await Functionalities.getLastNewsId();
    String query = "";

    for (var id in newsIds) {
      if (id['id'] == lastId) break;
      query += "include[]=${id['id']}&";
    }
    var tagObjsJson = jsonDecode(initialContent) as List;
    //List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    List<News> previousNews = tagObjsJson.map((e) => News.fromJson(e)).toList();

    if (query != "") {
      var newNews = await NetworkHelper(
              '${urlToSite}posts?${query}_fields=id,categories,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
          .getData();
      formatNews(newNews);
      mapNews();
    }

    Functionalities.allNews.addAll(previousNews);
    allNews.toSet().toList(growable: true);
    // print(Functionalities.allNews.toString());
    await Functionalities.saveLastNewsId(Functionalities.allNews[0].id);
    await Functionalities.writeInitialContent(Functionalities.allNews);
  }

  static List<News> formatNews(var rawNews) {
    List<News> newNews = [];
    for (var singleNews in rawNews) {
      int id;
      String title, excerpt, date;
      String content = singleNews['content']['rendered'].toString();
      content = content
          .replaceAll('<p>&nbsp;</p>', "")
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8216;", " ").replaceAll("search.ulab", "fwatch.bangladesh");

      id = singleNews['id'];
      date = singleNews['date']
          .toString()
          .substring(0, singleNews['date'].toString().indexOf('T'));
      String dateFormatted = new DateFormat("MMMM d, yyyy").format(DateTime.parse(date));
      content = content
          .replaceAll(dateFormatted, "")
          .replaceAll('[$dateFormatted]', "")
          .replaceAll("Published on:", "")
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8211;", "")
          .replaceAll("&#8220;", "")
          .replaceAll("&#8221;", "");
      date = new DateFormat("MMMM d,yyyy").format(DateTime.parse(date));
      content = content
          .replaceAll(dateFormatted, "")
          .replaceAll('[$dateFormatted]', "").replaceAll("&nbsp;"," ");

      title = singleNews['title']['rendered']
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8216;", " ");
      excerpt = singleNews['excerpt']['rendered']
          .toString()
          .replaceAll("<p>", "")
          .replaceAll('[$date]', "")
          .replaceAll("&hellip; </p>", "...")
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8216;", " ").replaceAll("&nbsp;"," ");
      excerpt = excerpt
          .replaceAll("Published on: ", "")
          .replaceAll("&#8211;" "", "")
          .replaceAll("&#8211;", "")
          .replaceAll("&#8220;", "")
          .replaceAll("&#8221;", "").replaceAll("</p>","");

      title = title
          .replaceAll("&#8211;", "")
          .replaceAll("&#8220;", "")
          .replaceAll("&#8221;", "").replaceAll("&nbsp;"," ");

      String categories = singleNews['categories'].toString();
      //  print(categories);
      var thumbnail, mediumLarge;
      try {
        thumbnail = singleNews['_embedded']['wp:featuredmedia'][0]
            ['media_details']['sizes']['medium']['source_url'];
        mediumLarge = singleNews['_embedded']['wp:featuredmedia'][0]
            ['media_details']['sizes']['medium_large']['source_url'];
      } catch (e) {
        print(e);
      }
      Functionalities.allNews.add(News(
          id: id,
          title: title,
          excerpt: excerpt,
          mediaLinkLarge: mediumLarge,
          thumbnail: thumbnail,
          date: dateFormatted,
          description: content,
          categories: categories));
      newNews.add(News(
          id: id,
          title: title,
          excerpt: excerpt,
          mediaLinkLarge: mediumLarge,
          thumbnail: thumbnail,
          date: dateFormatted,
          description: content,
          categories: categories));
    }
    allNews.toSet().toList(growable: true);
    return newNews;
  }

  static Future<int?> getLastNewsId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('lastId');
  }

  static Future<String> get _localPath async {
    final directory = await getExternalStorageDirectory();

    return directory!.path;
  }

  static Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/news.json');
  }

  static Future<String> getInitialContent() async {
    try {
      final file = await _localFile;
      return await file.readAsString();
    } catch (e) {
      print(e);
      return "";
    }
  }

  static Future<void> getInitNews() async {
    var newsData = await NetworkHelper(
            '${urlToSite}posts?per_page=50&_fields=categories,id,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
        .getData();

    formatNews(newsData);
    await saveLastNewsId(Functionalities.allNews[0].id);
    await saveFirstRun();
    await writeInitialContent(Functionalities.allNews);
    await mapNews();
  }

  static Future<List<News>> fetchNewsBySearch(String searchText) async {
    List<News> searchResult = [];
    List<dynamic> newsIds = await NetworkHelper(
            '${urlToSite}posts?search=$searchText&per_page=100&_fields=id')
        .getData();
    List<int> intList = newsIds.map((s) => s['id'] as int).toList();
    allNews.forEach((element) {
      if (intList.contains(element.id)) intList.remove(element.id);
    });
    int loopSize = (intList.length / 10).ceil().toInt();
    //if(intList.length%10>0)loopSize++;
    for (int i = 0; i < loopSize; i++) {
      String query = "";
      List<int> blackList = [];
      for (var id in intList) {
        query += "include[]=$id&";
        blackList.add(id);
        if (blackList.length == 10) break;
      }
      intList.removeRange(0, blackList.length);

      if (query != "") {
        var newNews = await NetworkHelper(
                '${urlToSite}posts?${query}_fields=id,categories,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
            .getData();
        searchResult.addAll(formatNews(newNews));

        await writeInitialContent(Functionalities.allNews);
        mapNews();
      }
    }
    return searchResult;
  }

  static Future<List<News>> fetchNewsByCategory(int id) async {
    List<News> searchResult = [];
    List<dynamic> newsIds = await NetworkHelper(
            '${urlToSite}posts?categories=$id&per_page=100&_fields=id')
        .getData();

    List<int> intList = newsIds.map((s) => s['id'] as int).toList();
    getNewsByCategory(id).forEach((element) {
      if (intList.contains(element.id)) intList.remove(element.id);
    });
    int loopSize = (intList.length / 10).ceil().toInt();
    //if(intList.length%10>0)loopSize++;
    for (int i = 0; i < loopSize; i++) {
      String query = "";
      List<int> blackList = [];
      for (var id in intList) {
        query += "include[]=$id&";
        blackList.add(id);
        if (blackList.length == 10) break;
      }
      intList.removeRange(0, blackList.length);

      if (query != "") {
        var newNews = await NetworkHelper(
                '${urlToSite}posts?${query}_fields=id,categories,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
            .getData();
        searchResult.addAll(formatNews(newNews));

        await writeInitialContent(Functionalities.allNews);
        mapNews();
      }
    }
    return searchResult;
  }

  static writeInitialContent(var news) async {
    try {
      final file = await _localFile;

      // Write the file.
      file.writeAsString('${json.encode(news)}');
    } catch (e) {
      print(e);
    }
  }

  static getNews() async {

    initialContent = await getInitialContent();
    if (initialContent != "")
      await getSelectedNews();
    else
      await getInitNews();
    mapNews();
    List<int> favs = await loadFavorites();
    favs.forEach((element) {
      favoriteNews.favoriteNews.add(element);
    });
    await loadUser();
    // bool firstRun = await checkFirstRun();
    // try {
    //   initialContent = await getInitialContent();
    //   if (initialContent == "") {
    //     await getInitNews();
    //     return;
    //   } else {
    //     getSelectedNews();
    //   }
    //   return;
    // } catch (e) {
    //   print(e);
    //   await getInitNews();
    //   return;
    // }
    // if (firstRun == true)
    //   await getInitNews();
    // else {
    //   await getSelectedNews();
    // }
  }

  static Future<bool> checkFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    bool firstRun = prefs.getBool('firstRun') ?? true;
    return firstRun;
  }
  static loadUser()async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    dynamic test =pref.getString('user');
    if(test!=null){
      Map<String, dynamic> userMap = jsonDecode(test);
      var userLoad = User.fromJson(userMap);
      user=userLoad;
    }
    print(user.toString());
  }
  static saveFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstRun", false);
  }

  static Future<void> setFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

// your custom int list

// convert your custom list to string list
    List<String> stringsList =
        favoriteNews.favoriteNews.map((i) => i.toString()).toList();

// store your string list in shared prefs
    prefs.setStringList("favorites", stringsList);
  }

  static Future<List<int>> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

// fetch your string list
    List<String>? mList = prefs.getStringList('favorites');

//convert your string list to your original int list
    List<int> mOriginaList =
        (mList == null) ? [] : mList.map((i) => int.parse(i)).toList();
    return mOriginaList;
  }

  static void launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  static getCategories() async {
    var categories = await NetworkHelper(
            '${urlToSite}categories?_fields=id,name')
        .getData();
    for (var category in categories) {
      Functionalities.categories[category['id']] = category['name'];
    }
    // Functionalities.categories[252] = "আইন-আদালত";
    // Functionalities.categories[253] = "তথ্য যাচাই";
    // Functionalities.categories[255] =  "জন উদ্যোগ";
    // Functionalities.categories[259] = "লেখাজোখা";
    // Functionalities.categories[261] = "তথ্য যাচাই";
    // Functionalities.categories[265] =  "জনস্বাস্থ্য";
    // Functionalities.categories[266] = "বিজ্ঞান ও পরিবেশ";
    // Functionalities.categories[271] =  "করোনা তথ্য যাচাই";
    // Functionalities.categories[273] = "জরুরি পরামর্শ";
    // Functionalities.categories[276] = "ফ্যাক্টওয়াচ ভিডিও";
    // Functionalities.categories[277] = "বিজ্ঞাপন যাচাই";
    // Functionalities.categories[278] = "স্বাস্থ্য";
    // Functionalities.categories[280] = "বাংলাদেশ";
    // Functionalities.categories[282] =  "করোনা মহামারি";
    // Functionalities.categories[283] = "ফ্যাক্ট ফাইল";
    // print(Functionalities.categories);
    // print(allNews[allNews.length - 1].id);
  }

  static List<News?>? getFavorites() {
    List<News?>? favorites = [];
    for (int i in favoriteNews.favoriteNews) favorites.add(newsMap[i]);
    return favorites;
  }
}

class CurveDraw extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double sw = size.width;
    double sh = size.height;
    //double gapConst = 50;
    Path path = Path();
    path.moveTo(0, sh);
    path.lineTo(0, sh / 2);
    path.quadraticBezierTo(0, 0, sh / 2, 0);
    path.lineTo(sw / 2 - sw / 5, 0);
    path.cubicTo(sw / 2 - sw / 8, 0, sw / 2 - sw / 8, sh / 2, sh / 2, sh / 2);
    path.cubicTo(
        sw / 2 + sw / 8, sh / 2, sw / 2 + sw / 8, 0, sw / 2 + sw / 5, 0);
    path.lineTo(sw - sh / 2, 0);
    path.quadraticBezierTo(sw, 0, size.width, sh / 2);
    path.lineTo(sw, sh);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
