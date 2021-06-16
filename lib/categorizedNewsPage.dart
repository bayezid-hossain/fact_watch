import 'dart:convert';

import 'package:fact_watch/homepageData.dart';
import 'package:flutter/material.dart';
import 'functionalities.dart';
import 'News.dart';
class CategorizedNews extends StatefulWidget {

  final int id;
  CategorizedNews(@required this.id);
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
