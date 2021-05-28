import 'dart:convert';

import 'package:fact_watch/individual_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart' as constants;
import 'functionalities.dart';
import 'homepageData.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'News.dart';
import 'networking/background_task.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  FocusNode focusNode = FocusNode();
  String hintText = "Search";
  bool searching = false;
  int index = 0;
  static int length=0;
  static String content="";
  String searchContent = "";
  PageController _pageController=new PageController();
  static List<News> newsToShow=[];
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    try {
      BackgroundTask.isForeground = state == AppLifecycleState.resumed;
    } catch (e) {
      print(e);
    }
    if (AppLifecycleState.resumed == state)
      setState(() {
        //searching = searching;
        //index = index;
      });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newsToShow = Functionalities.allNews;
    length = 25;
    content = jsonEncode(newsToShow);
    WidgetsBinding.instance!.addObserver(this);
    _pageController = PageController(initialPage: index);
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Search';
      }
      setState(() {});
    });
  }

  final tabs = [
    HomePageData(content, length),
    //IndividualNews(Functionalities.allNews[0]),
  ];

  @override
  Widget build(BuildContext context) {
    if (searchContent == "") searchContent = content;
    if (newsToShow.length == 0) {
      var tagObjsJson = jsonDecode(searchContent) as List;
      newsToShow = tagObjsJson.map((e) => News.fromJson(e)).toList();
    }
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: !searching
              ? Center(
                  child: Image.asset(
                    'assets/fact_watch.png',
                    width: 120,
                    height: 40,
                    fit: BoxFit.fill,
                  ),
                )
              : TextField(
                  onChanged: searchNewsByTitle,
                  focusNode: focusNode,
                  decoration: InputDecoration(
                      hintText: hintText,
                      fillColor: Colors.white,
                      filled: true,
                      prefixIcon: Icon(Icons.search_sharp, color: Colors.black),
                      suffixIcon: InkWell(
                        child: Icon(
                          Icons.clear,
                          color: Colors.black,
                        ),
                        onTap: () {
                          setState(() {
                            searchContent = content;
                            length = 25;
                            searching = !searching;
                          });
                        },
                      )),
                ),
          actions: [
            Visibility(
              visible: searching ? false : true,
              child: IconButton(
                  icon: Icon(Icons.search_sharp, color: Colors.black),
                  onPressed: () {
                    setState(() {
                      searching = !searching;
                    });
                  }),
            )
          ],
        ),
        bottomNavigationBar: FFNavigationBar(
          theme: FFNavigationBarTheme(
            barBackgroundColor: Colors.white,
            selectedItemBorderColor: Colors.white,
            selectedItemBackgroundColor: Colors.blue,
            selectedItemIconColor: Colors.white,
            selectedItemLabelColor: Colors.black,
          ),
          selectedIndex: index,
          onSelectTab: onTabTapped,
          items: [
            FFNavigationBarItem(
              iconData: Icons.home_outlined,
              label: 'Home',
            ),
            FFNavigationBarItem(
              iconData: Icons.bookmark_border_outlined,
              label: 'Saved',
            ),
            FFNavigationBarItem(
              iconData: Icons.videocam,
              label: 'Videos',
            ),
            FFNavigationBarItem(
              iconData: Icons.people,
              label: 'Settings',
            ),
          ],
        ),
        body: PageView(
          children: [
            HomePageData(searchContent, length),
            //IndividualNews(Functionalities.allNews[0]),
          ],
          onPageChanged: onPageChanged,
          controller: _pageController,
        ),
        drawer: SafeArea(
          child: Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                primaryColor: Colors.black,
              ),
              child: constants.getDrawer(context)),
        ),
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this.index = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic);
  }

  void searchNewsByCategory(String query) {
    final news = Functionalities.allNews.where((news) {
      return news.categories.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      newsToShow = news;
      length = news.length;
    });
  }

  void searchNewsByTitle(String query) {
    if (newsToShow.length == 0) {
      var tagObjsJson = jsonDecode(searchContent) as List;
      newsToShow = tagObjsJson.map((e) => News.fromJson(e)).toList();
    }
    if (query == "") {
      setState(() {
        searchContent = content;
        length = 25;
      });
      return;
    }
    final news = newsToShow.where((news) {
      return news.title.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      searchContent = jsonEncode(news);
      length = news.length;
    });
  }
}
