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
  final String searchText, searchCategory;
  final int categoryId;
  final String content;
  HomePageData(this.categoryId,
      [this.searchText = "", this.searchCategory = "",this.content=""]);

  @override
  Widget build(BuildContext context) {
    if(content!=""){
      var tagObjsJson = jsonDecode(content) as List;
      List<News> newsFromHomePage = tagObjsJson.map((e) => News.fromJson(e)).toList();
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: ListView.builder(

                physics: AlwaysScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newsFromHomePage.length + 1,
                        itemBuilder: (context, index) {
                          if (index == newsFromHomePage.length) {
                            return Column(children: [
                              Column(
                                children: [

                                  if (searchText != "")
                                    FutureBuilder(
                                        future: Functionalities.fetchNewsBySearch(
                                            searchText),
                                        builder: (context, AsyncSnapshot snapshot) {
                                          if (!snapshot.hasData) {
                                            return SizedBox(
                                              child: Center(
                                                child: CircularProgressIndicator(),
                                              ),
                                              height: 50,
                                            );
                                          } else {
                                            newsFromHomePage.addAll(
                                                (snapshot).data);
                                            return ListView.builder(
                                                shrinkWrap: true,
                                                physics: ClampingScrollPhysics(),
                                                itemCount: (snapshot)
                                                    .data
                                                    .length,
                                                itemBuilder:
                                                    (BuildContext context, int index) {
                                                  try {
                                                    return NewsExample(
                                                      news: snapshot.data[index],
                                                      big: ((index % 5) == 0)
                                                          ? true
                                                          : false,
                                                    );
                                                  } catch (e) {
                                                    print(e);
                                                    return SizedBox();
                                                  }
                                                });
                                          }
                                        }),
                                  Padding(padding:EdgeInsets.symmetric(vertical: 8),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Divider(),
                                        Divider(),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Expanded(
                                          child: buildCard(),
                                        ),
                                        Expanded(
                                          child: buildImages(),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                            ]);
                          } else
                            try {
                              if (index == -2) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      width: double.infinity,
                                      child: RaisedGradientButton(
                                          child: Text(
                                            'Latest',
                                            style: TextStyle(color: Colors.black),
                                          ),
                                          gradient: LinearGradient(
                                            colors: <Color>[
                                              Colors.yellow,
                                              Colors.white
                                            ],
                                          ),
                                          onPressed: () {
                                            print('button clicked');
                                          }),
                                    ),
                                    NewsExample(
                                      news: newsFromHomePage[index],
                                      big: ((index % 5) == 0) ? true : false,
                                    )
                                  ],
                                );
                              }
                              return NewsExample(
                                news: newsFromHomePage[index],
                                big: ((index % 5) == 0) ? true : false,
                              );
                            } catch (e) {
                              print(e);
                              return SizedBox();
                            }
                        })
            ),
          ],
        ),
      );
    }
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: FutureBuilder(
                future: Functionalities.getNewsByCategory(categoryId),
                builder: (context, AsyncSnapshot news){
                  if(news.hasData)return ListView.builder(
                      shrinkWrap: true,
                      itemCount: news.data.length + 1,
                      itemBuilder: (context, index) {
                        if (index == news.data.length) {
                          return Column(children: [
                            Column(
                              children: [
                                if (categoryId != -1)
                                  FutureBuilder(
                                      future: Functionalities.fetchNewsByCategory(
                                          categoryId),
                                      builder: (context, AsyncSnapshot snapshot) {
                                        if (!snapshot.hasData) {
                                          if(news.data.length==0)return Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.stretch,
                                            children: [
                                              news.data.length == 0
                                                  ? Container(
                                                height: MediaQuery.of(context).size.height /
                                                    2.5, // Also Including Tab-bar height.
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
//                                           child: Center(
//                                               child: Text(
//                                                 "Nothing to show",
//                                                 style: TextStyle(
//                                                     fontSize: 25, color: Colors.grey),
//                                               )),
                                                child: Center(child: CircularProgressIndicator(),),
                                              )
                                                  : Container(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Divider(),
                                                  Divider(),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Expanded(
                                                    child: buildCard(),
                                                  ),
                                                  Expanded(
                                                    child: buildImages(),
                                                  )
                                                ],
                                              ),
                                            ],
                                          );
                                          else return Container(child: Column(children:[ Padding(padding:EdgeInsets.all(8),child: Center(child: CircularProgressIndicator(),)),Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Divider(),
                                              Divider(),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              Expanded(
                                                child: buildCard(),
                                              ),
                                              Expanded(
                                                child: buildImages(),
                                              )
                                            ],
                                          ),]),);

                                        } else {
                                          news.data.addAll(
                                              (snapshot).data);
                                          if((snapshot).data.length==0){
                                            return Column(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: [
                                                news.data.length == 0
                                                    ? Container(
                                                  height: MediaQuery.of(context).size.height /
                                                      2.5, // Also Including Tab-bar height.
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
                                                  child: Center(
                                                      child: Text(
                                                        "Nothing to show",
                                                        style: TextStyle(
                                                            fontSize: 25, color: Colors.grey),
                                                      )),
//                                             child: Center(child: CircularProgressIndicator(),),
                                                )
                                                    : Container(
                                                  height: 20,
                                                ),
                                                Row(
                                                  mainAxisSize: MainAxisSize.max,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Divider(),
                                                    Divider(),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    Expanded(
                                                      child: buildCard(),
                                                    ),
                                                    Expanded(
                                                      child: buildImages(),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            );
                                          }
                                          return ListView.builder(
                                              shrinkWrap: true,
                                              physics: ClampingScrollPhysics(),
                                              itemCount: (snapshot)
                                                  .data
                                                  .length,
                                              itemBuilder:
                                                  (BuildContext context, int index) {
                                                try {
                                                  return NewsExample(
                                                    news: snapshot.data[index],
                                                    big: ((index % 5) == 0)
                                                        ? true
                                                        : false,
                                                  );
                                                } catch (e) {
                                                  print(e);
                                                  return SizedBox();
                                                }
                                              });
                                        }
                                      }),

                              ],
                            ),

                          ]);
                        } else
                          try {
                            if (index == -2) {
                              return Column(
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: RaisedGradientButton(
                                        child: Text(
                                          'Latest',
                                          style: TextStyle(color: Colors.black),
                                        ),
                                        gradient: LinearGradient(
                                          colors: <Color>[
                                            Colors.yellow,
                                            Colors.white
                                          ],
                                        ),
                                        onPressed: () {
                                          print('button clicked');
                                        }),
                                  ),
                                  NewsExample(
                                    news: news.data[index],
                                    big: ((index % 5) == 0) ? true : false,
                                  )
                                ],
                              );
                            }
                            return NewsExample(
                              news: news.data[index],
                              big: ((index % 5) == 0) ? true : false,
                            );
                          } catch (e) {
                            print(e);
                            return SizedBox();
                          }
                      });
                  else{
                    return SizedBox(height: double.infinity,width: double.infinity,child: Center(child: CircularProgressIndicator(),),);
                  }
                }
            ),
          ),
        ],
      ),
    );
  }
}

class NewsExample extends StatelessWidget {
  final News news;
  final bool big;
  NewsExample({required this.news, required this.big});

  @override
  Widget build(BuildContext context) {
    return big
        ? NewsTile(
            news: news,
            removeTile: false,
            function: () {},
          )
        : NewsTileSmall(
            news: news,
            removeTile: false,
            function: () {},
          );
  }
}
