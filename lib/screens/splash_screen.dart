import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fact_watch/screens/individual_news.dart';
import 'package:fact_watch/main.dart';

import 'package:connectivity/connectivity.dart';
import 'package:fact_watch/screens/userInfoPage.dart';
import 'package:fact_watch/views/FirstRunUserInfoPage.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
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
  String _connectionStatus = 'Unknown';
  var _key = new GlobalKey<ScaffoldState>();
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;

  bool firstRun = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
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
    _connectivitySubscription.cancel();
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

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        //showDefaultSnackbar(_key,result.toString());
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        //showDefaultSnackbar(_key,result.toString());
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  void startApp() async {
    firstRun = await Functionalities.checkFirstRun();

      FirebaseMessaging.instance.unsubscribeFromTopic("fact").then((value) {
        print("unsubscribed");
        FirebaseMessaging.instance.subscribeToTopic("fact").then((value) => print("subscribed"));
      });
    //
    // var messaging = FirebaseMessaging.instance;
    //   messaging.getToken().then((value){
    //     var myData = {"token":value};
    //     var collection = FirebaseFirestore.instance.collection('tokens');
    //     collection.doc(value).set(myData) // <-- Your data
    //         .then((_) => print('Added'))
    //         .catchError((error) => print('Add failed: $error'));
    //   });
    // print(firstRun);
    //showDefaultSnackbar(_key);
    try {
      await Functionalities.getNews();
      await Functionalities.getCategories();

      if(!firstRun)Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
      else Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>FirstRunUserInfoPage()));
    } catch (e) {
      if (e.toString().contains("socket") || e.toString().contains("Socket")) {
        showDefaultSnackbar(_key, "Internet Connection Error");
      }
      //else showDefaultSnackbar(_key,e.toString());
    }
  }

  void showDefaultSnackbar(var key, String text) {
    // final scaffold=Scaffold.of(context);
    key.currentState.showSnackBar(SnackBar(
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("$text"),
          TextButton(
              onPressed: () async{
                await Functionalities.getOfflineNews();
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Text("Continue Offline",style: TextStyle(color: Colors.blue),)),
          TextButton(
              onPressed: () async{
                try {
                    await Functionalities.getNews();
                    await Functionalities.getCategories();

                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => HomePage()));
                } catch (e) {
                  if (e.toString().contains("socket") ||
                      e.toString().contains("Socket")) {
                    showDefaultSnackbar(_key, "Internet Connection Error");
                  }
                }
              },
              child: Text("Retry",style: TextStyle(color: Colors.blue),))
        ],
      ),

      duration: Duration(hours: 1),
    ));
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
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
