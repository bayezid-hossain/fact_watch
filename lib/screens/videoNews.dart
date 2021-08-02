import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:fact_watch/views/homepageData.dart';
import 'package:flutter/material.dart';
import '../functions/functionalities.dart';
import '../models/News.dart';
class VideoNews extends StatefulWidget {

  final int id;
  VideoNews(this.id);
  @override
  _VideoNewsState createState() => _VideoNewsState();
}

class _VideoNewsState extends State<VideoNews> {


  @override
  Widget build(BuildContext context) {
    List<News> categorizedNews=Functionalities.getNewsByCategory(widget.id);

    return Scaffold(body: HomePageData(jsonEncode(categorizedNews),categorizedNews.length,"",widget.id.toString()));
  }
}
