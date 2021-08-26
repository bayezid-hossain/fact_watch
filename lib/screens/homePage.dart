// @dart=2.9
import 'dart:convert';
import 'dart:typed_data';

import 'package:fact_watch/screens/userInfoPage.dart';
import 'package:fact_watch/screens/videoNews.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../functions/constants.dart' as constants;
import '../functions/functionalities.dart';
import '../main.dart';
import '../views/homepageData.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import '../models/News.dart';
import 'package:http/http.dart' as http;
import '../views/keepAlivePage.dart';
import 'individual_news.dart';
import 'viewFavorites.dart';
import 'package:move_to_background/move_to_background.dart';
Future<Uint8List> _getByteArrayFromUrl(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

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
  static String searchText="";
  String searchContent = "";
  var currentPageValue=0.0;
  PageController _pageController=new PageController();
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (AppLifecycleState.resumed == state)
      setState(() {
        //searching = searching;
        if(searchText=="")searchContent=Functionalities.initialContent;
        //index = index;
      });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    length = 25;
    content = Functionalities.initialContent;
    WidgetsBinding.instance.addObserver(this);
    _pageController = PageController(initialPage: index,keepPage: true);
    _pageController.addListener(() {
      setState(() {
        currentPageValue=_pageController.page;
      });
    });
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'Search';
      }
      setState(() {});
    });
  }


  @override
  Widget build(BuildContext context) {

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {

      if (message.data['id']!=null) {

        print('foreground');
        // ignore: missing_return
        News newNews;
        bool update=await Functionalities.checkIfUpdate(int.parse(message.data['id']));

        if(update==false){
          newNews = await Functionalities.getSingleNews(int.parse(message.data['id']));

        }
        else {
          await Functionalities.updatePost(int.parse(message.data['id']));
          setState(() {

            if(searchText=="")searchContent=Functionalities.initialContent;
          });
          return;
        }
        final ByteArrayAndroidBitmap largeIcon = ByteArrayAndroidBitmap(
            await _getByteArrayFromUrl(
                'https://dev.factwatch.org/wp-content/uploads/2021/06/FactWatch_Logo1.png'));
        final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
            await _getByteArrayFromUrl(newNews.mediaLinkLarge));

        final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(bigPicture,
            largeIcon: largeIcon,
            contentTitle: '<p>${newNews.title}</p>',
            htmlFormatContentTitle: true,
            summaryText: '<p>${newNews.excerpt}</p>',
            htmlFormatSummaryText: true);
        flutterLocalNotificationsPlugin.initialize(initSettings,onSelectNotification: (String payload){
          print(payload);
          // News news=jsonDecode(payload);
          Map<String, dynamic> userMap = jsonDecode(payload);
          var newsLoad = News.fromJson(userMap);

          Navigator.push(context,
              MaterialPageRoute(builder: (context) => IndividualNews(newsLoad)));
          print("KK");

        });

        flutterLocalNotificationsPlugin.show(
          message.notification.hashCode,
          newNews.title,
          newNews.excerpt,

          NotificationDetails(
            android: AndroidNotificationDetails(
              channel.id,
              channel.name,
              channel.description,
              color: Colors.blue,
              playSound: true,
              icon: '@mipmap/ic_launcher',
              styleInformation: bigPictureStyleInformation,
            ),
          ),
          payload: jsonEncode(newNews),
        );
        setState(() {
          if(searchText=="")searchContent=Functionalities.initialContent;
        });
      }
    });
    if (searchContent == "") searchContent = content;
    return DefaultTabController(
      length: 4,
      child: WillPopScope(
        onWillPop: ()async{
            MoveToBackground.moveTaskToBack();
            return false;
        },
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
              style: TextStyle(fontFamily: "Kalpurush"),
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
              selectedItemBorderColor: Colors.blue,
              selectedItemBackgroundColor: Colors.white,
              selectedItemIconColor: Colors.orange,

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
          body: RefreshIndicator(
            onRefresh: (){
              setState(() {

              });
            },
            child: PageView(
              children: [
                KeepAlivePage(child: HomePageData(0,searchText,"",searchContent)),
                KeepAlivePage(child: ViewFavorites()),
                KeepAlivePage(child: VideoNews(4)),
                KeepAlivePage(child: UserInfoPage(comment: false,homePage: true,)),
                //IndividualNews(Functionalities.allNews[0]),Indiv
              ],
              onPageChanged: onPageChanged,
              controller: _pageController,
            ),
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
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this.index = page;
      //_pageController.jumpTo(currentPageValue);
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeIn);
  }
  //
  // void searchNewsByCategory(String query) {
  //   final news = Functionalities.allNews.where((news) {
  //     return news.categories.toLowerCase().contains(query.toLowerCase());
  //   }).toList();
  //   setState(() {
  //     newsToShow = news;
  //     length = news.length;
  //   });
  // }

  void searchNewsByTitle(String query) {

    if (query == "") {
      setState(() {
        searchContent = content;
        length = 25;
      });
      return;
    }
    searchText=query;
    final news = Functionalities.allNews.where((news) {
      return news.title.toLowerCase().contains(query.toLowerCase())||news.description.toLowerCase().contains(query.toLowerCase());
    }).toList();
    setState(() {
      searchContent = jsonEncode(news);
      length = news.length;
    });
  }

}
