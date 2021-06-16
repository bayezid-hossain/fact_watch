import 'dart:convert';

import 'package:fact_watch/functionalities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'News.dart';
import 'newsTile.dart';
import 'newsTileSmall.dart';

class HomePageData extends StatelessWidget {
  final String content;
  final int length;
  final String searchText,searchCategory;
  HomePageData(this.content, this.length,[this.searchText="",this.searchCategory=""]);


  @override
  Widget build(BuildContext context) {

    var tagObjsJson = jsonDecode(content) as List;
    List<News> news = tagObjsJson.map((e) => News.fromJson(e)).toList();

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: length + 1,
                itemBuilder: (context, index) {
                  if (index == length) {
                    return Column(
                      children: [Column(
                        children: [

                          if(searchCategory!="")FutureBuilder(
                              future: Functionalities.fetchNewsByCategory(int.parse(searchCategory)),
                              builder:(context, AsyncSnapshot snapshot) {
                                if (!snapshot.hasData) {
                                  return SizedBox(child: Center(child: CircularProgressIndicator(),),height: 50,);
                                } else {
                                  return ListView.builder(
                                    shrinkWrap: true,
                                      itemCount: (snapshot as AsyncSnapshot).data.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        try {
                                          return NewsExample(
                                            news: snapshot.data[index],
                                            big: ((index % 5) == 0) ? true : false,
                                          );
                                        } catch (e) {
                                          print(e);
                                          return SizedBox();
                                        }
                                      }
                                  );
                                }
                              }
                          ),
                          if(searchText!="")FutureBuilder(
                          future: Functionalities.fetchNewsBySearch(searchText),
                           builder:(context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                              return SizedBox(child: Center(child: CircularProgressIndicator(),),height: 50,);
                              }
                              else {
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: (snapshot as AsyncSnapshot).data.length,
                                itemBuilder: (BuildContext context, int index) {
                                  try {
                                    return NewsExample(
                                      news: snapshot.data[index],
                                      big: ((index % 5) == 0) ? true : false,
                                    );
                                  } catch (e) {
                                print(e);
                                return SizedBox();
                                  }
                                  }
                                );
                               }
                              }
                              ),
                        ],
                      ),Row(
                        // mainAxisSize: MainAxisSize.max,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Divider(),
                          Divider(),
                          Expanded(
                            child: _buildCard(),
                          ),
                          Expanded(
                            child: _buildImages(),
                          )
                        ],
                      ),
                    ]);
                  } else
                    try {
                      return NewsExample(
                        news: news[index],
                        big: ((index % 5) == 0) ? true : false,
                      );
                    } catch (e) {
                      print(e);
                      return SizedBox();
                    }
                }),
          ),
        ],
      ),
    );
  }
}

class NewsExample extends StatelessWidget {
  final News news;
  final bool big;
  NewsExample({required this.news,required this.big});

  @override
  Widget build(BuildContext context) {
    return big
        ? NewsTile(
            news: news,
          )
        : NewsTileSmall(news: news);
  }
}

Widget _buildCard() => Column(
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
Widget _buildStack() => Stack(
      alignment: const Alignment(0.6, 0.6),
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('images/pic.jpg'),
          radius: 100,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black45,
          ),
          child: Text(
            'Mia B',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );

