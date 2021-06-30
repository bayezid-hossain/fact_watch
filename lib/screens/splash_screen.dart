import 'dart:convert';
import 'package:fact_watch/screens/individual_news.dart';
import 'package:fact_watch/main.dart';

import 'package:flutter/services.dart';

import '../functions/functionalities.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fact_watch/models/News.dart';
import 'homePage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

// static List<News> Functionalities.allNews = [];

class _SplashScreenState extends State<SplashScreen>
    with WidgetsBindingObserver {
  bool firstRun = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    WidgetsBinding.instance!.addObserver(this);
    startApp();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    super.dispose();
  }

  void onClick(String payload) {
    //var tagObjsJson = jsonDecode(payload) as List;
    //List<Tag> tagObjs = tagObjsJson.map((tagJson) => Tag.fromJson(tagJson)).toList();
    //List<News> previousNews = tagObjsJson.map((e) => News.fromJson(e)).toList();
    News news = News.fromJson(jsonDecode(payload));

    MyApp.navigatorKey.currentState!
        .push(MaterialPageRoute(builder: (context) => IndividualNews(news)));
  }

  void startApp() async {
    firstRun = await Functionalities.checkFirstRun();
   // print(firstRun);

    await Functionalities.getNews();
    await Functionalities.getCategories();

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xD2EFFF),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/splash.png"),
            ),
          ),
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              (firstRun == true)
                  ? Align(
                      alignment: Alignment.center,
                      child: Text(
                        "First run may take some time",
                        style: TextStyle(fontSize: 12),
                      ))
                  : Text(""),
              Align(
                alignment: Alignment.bottomCenter,
                child: SpinKitThreeBounce(
                  size: 20,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
