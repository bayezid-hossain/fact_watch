import 'dart:convert';
import 'package:fact_watch/views/raisedGradientButton.dart';
import 'package:fact_watch/functions/functionalities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/News.dart';
import 'newsTile.dart';
import 'newsTileSmall.dart';
import 'package:fact_watch/functions/constants.dart';
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
                                  news.addAll((snapshot as AsyncSnapshot).data);
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
                          if(searchText!="")FutureBuilder(
                          future: Functionalities.fetchNewsBySearch(searchText),
                           builder:(context, AsyncSnapshot snapshot) {
                              if (!snapshot.hasData) {
                                 return SizedBox(child: Center(child: CircularProgressIndicator(),),height: 50,);
                              }
                              else {
                                news.addAll((snapshot as AsyncSnapshot).data);
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
                          SizedBox(height: 20,),
                          Expanded(
                            child: buildCard(),
                          ),
                          Expanded(
                            child: buildImages(),
                          )
                        ],
                      ),
                    ]);
                  } else
                    try {
                      if(index==-2){
                        return Column(children: [
                          SizedBox(
                            width: double.infinity,
                            child: RaisedGradientButton(
                                child: Text(
                                  'Latest',
                                  style: TextStyle(color: Colors.black),
                                ),
                                gradient: LinearGradient(
                                  colors: <Color>[Colors.yellow, Colors.white],
                                ),
                                onPressed: (){
                                  print('button clicked');
                                }
                            ) as Widget,
                          ),
                          NewsExample(
                            news:news[index],
                            big: ((index % 5) == 0) ? true : false,
                          )
                        ],);
                      }
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
            news: news,removeTile: false,function: (){},
          )
        : NewsTileSmall(news: news,removeTile: false,function: (){},);
  }
}
