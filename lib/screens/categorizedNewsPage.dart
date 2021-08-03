import 'dart:convert';

import 'package:fact_watch/views/homepageData.dart';
import 'package:flutter/material.dart';
import '../functions/functionalities.dart';
import '../models/News.dart';
class CategorizedNews extends StatefulWidget {

  final int id;
  CategorizedNews(this.id);
  @override
  _CategorizedNewsState createState() => _CategorizedNewsState();
}

class _CategorizedNewsState extends State<CategorizedNews> {


  @override
  Widget build(BuildContext context) {
    List<News> categorizedNews=Functionalities.getNewsByCategory(widget.id);

    return Scaffold(appBar: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title:Center(
        child: Image.asset(
          'assets/fact_watch.png',
          width: 120,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
    ),body: HomePageData(jsonEncode(categorizedNews),categorizedNews.length,"",widget.id.toString()));
  }
}

Widget _buildCard() => Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    // ListTile(
    //   title: Text(
    //     "যোগাযোগ",
    //     style: TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20,
    //     ),
    //     textAlign: TextAlign.left,
    //   ),
    // ),
    // Divider(),
    ListTile(
      title: Transform.translate(
        offset: Offset(-10, 0),
        child: InkWell(
          onTap: () {
            Functionalities.launchURL(
                "https://goo.gl/maps/nnuzsLUbQH1ezHfK9");
          },
          child: Text('বাড়ি# ৫৬,\nরোড # ৪/এ, \nসাতমসজিদ রোড,\nধানমন্ডি',
              style: TextStyle(fontWeight: FontWeight.w500)),
        ),
      ),
      subtitle: Transform.translate(
          offset: Offset(-10, 0), child: Text('ঢাকা -1209, বাংলাদেশ')),
      leading: Icon(
        Icons.map,
        color: Colors.blue[500],
        size: 25,
      ),
    ),
    Divider(),
    ListTile(
      title: InkWell(
        onTap: () {
          Functionalities.launchURL("tel:+88029661301");
        },
        child: Transform.translate(
          offset: Offset(-10, 0),
          child: Text('+৮৮০২৯৬৬১৩০১',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ),
      ),
      leading: Icon(
        Icons.phone,
        color: Colors.blue[500],
        size: 20,
      ),
    ),
    ListTile(
      title: InkWell(
        onTap: () {
          Functionalities.launchURL("tel:+88029661255");
        },
        child: Transform.translate(
          offset: Offset(-10, 0),
          child: Text('+৮৮০২৯৬৬১২৫৫',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ),
      ),
      leading: Icon(
        Icons.phone,
        color: Colors.blue[500],
        size: 20,
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.email_outlined,
        color: Colors.blue[500],
        size: 20,
      ),
      title: Transform.translate(
        offset: Offset(-10, 0),
        child: InkWell(
          onTap: () {
            Functionalities.launchURL("mailto:contact@fact-watch.org");
          },
          child: Text(
            "contact@fact-watch.org",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    ),
  ],
);
// #enddocregion Card

// #docregion Stack
Widget _buildImages() => Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    // Text(
    //   "যোগাযোগ",
    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    // ),
    Image.asset(
      "assets/cqs.png",
      height: 120,
      width: 120,
      color: Colors.black,
    ),
    SizedBox(
      height: 50,
    ),
    Image.asset(
      "assets/ifcn.png",
      height: 120,
      width: 120,
    ),
  ],
);