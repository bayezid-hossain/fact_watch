

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'News.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'networking/networking.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class Functionalities {
  static List<News> allNews = [];
  static List<News> videos = [];
  static Map<int, News> newsMap = {};
  static Map<int, String> categories = {};
  static String initialContent = "";
  static List<int> favoriteNews=[];
  static  saveLastNewsId(int id) async {
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

  static getSelectedNews() async {
    var newsIds = await NetworkHelper(
            'https://www.fact-watch.org/web/wp-json/wp/v2/posts?per_page=100&_fields=id')
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
              'https://www.fact-watch.org/web/wp-json/wp/v2/posts?${query}_fields=id,categories,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
          .getData();
       formatNews(newNews);
       mapNews();
    }

    Functionalities.allNews.addAll(previousNews);
    // print(Functionalities.allNews.toString());
    await Functionalities.saveLastNewsId(Functionalities.allNews[0].id);
    await Functionalities.writeInitialContent(Functionalities.allNews);
  }

  static void formatNews(var rawNews) {
    for (var singleNews in rawNews) {
      int id;
      String title, excerpt, date;
      String content = singleNews['content']['rendered'].toString();
      content = content
          .replaceAll('<p>&nbsp;</p>', "")
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8216;", " ");

      id = singleNews['id'];
      date = singleNews['date']
          .toString()
          .substring(0, singleNews['date'].toString().indexOf('T'));
      date = new DateFormat("MMMM d, yyyy").format(DateTime.parse(date));
      content = content
          .replaceAll(date, "")
          .replaceAll("Published on:", "")
          .replaceAll("&#8217;", " ");
      title = singleNews['title']['rendered']
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8216;", " ");
      excerpt = singleNews['excerpt']['rendered']
          .toString()
          .replaceAll("<p>", "")
          .replaceAll("&hellip; </p>", "...")
          .replaceAll("&#8217;", " ")
          .replaceAll("&#8216;", " ");
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
      Functionalities.allNews.add(News(id: id, title: title,excerpt:  excerpt,mediaLinkLarge:  mediumLarge,
          thumbnail: thumbnail,date:  date,description:  content, categories: categories,fav: false));
    }
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
            'https://www.fact-watch.org/web/wp-json/wp/v2/posts?per_page=100&_fields=categories,id,title,content,date,excerpt,_links&_embed=wp:featuredmedia')
        .getData();

    formatNews(newsData);
     await saveLastNewsId(Functionalities.allNews[0].id);
     await saveFirstRun();
     await writeInitialContent(Functionalities.allNews);
     await mapNews();
  }

  static  writeInitialContent(var news) async {
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

  static saveFirstRun() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("firstRun", false);
  }

  static void launchURL(String _url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
  static getCategories() async {
    var categories = await NetworkHelper(
            'https://www.fact-watch.org/web/wp-json/wp/v2/categories?_fields=id,name')
        .getData();
    for (var category in categories) {
      Functionalities.categories[category['id']] = category['name'];
    }
    Functionalities.categories[253] = "তথ্য যাচাই";
    Functionalities.categories[277] = "বিজ্ঞাপন যাচাই";
    Functionalities.categories[283] = "ফ্যাক্ট ফাইল";
    Functionalities.categories[261] = "তথ্য যাচাই";
    Functionalities.categories[278] = "স্বাস্থ্য";
    Functionalities.categories[276] = "ফ্যাক্টওয়াচ ভিডিও";
    Functionalities.categories[273] = "জরুরি পরামর্শ";
    Functionalities.categories[259] = "লেখাজোখা";
    Functionalities.categories[280] = "বাংলাদেশ";
    // print(Functionalities.categories);
    // print(allNews[allNews.length - 1].id);
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
