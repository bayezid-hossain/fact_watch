// @dart=2.9

import 'package:fact_watch/screens/splash_screen.dart';
import 'package:flutter/material.dart';

final RouteObserver <ModalRoute<void>> routeObserver=RouteObserver<ModalRoute<void>>();
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "MainNavigator");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      navigatorKey: navigatorKey,

      theme: ThemeData(
       // primarySwatch: Colors.blue,
        primaryColor: Colors.white,
      ),
      routes: {
        '/': (context) => SplashScreen(),
      },
      initialRoute: '/',
    );
  }
}
