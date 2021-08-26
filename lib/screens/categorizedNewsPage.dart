
import 'package:fact_watch/views/homepageData.dart';
import 'package:flutter/material.dart';
class CategorizedNews extends StatefulWidget {

  final int id;
  CategorizedNews(this.id);
  @override
  _CategorizedNewsState createState() => _CategorizedNewsState();
}

class _CategorizedNewsState extends State<CategorizedNews> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(appBar: AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      title: Center(
        child: Image.asset(
          'assets/fact_watch.png',
          width: 120,
          height: 40,
          fit: BoxFit.fill,
        ),
      ),
      actions: [
        Visibility(
          visible: true,
          child: IconButton(

              icon: Icon(Icons.search_sharp, color: Colors.transparent),
              onPressed: null,),
        )
      ],
    ),body: HomePageData(widget.id,""));
  }
}
