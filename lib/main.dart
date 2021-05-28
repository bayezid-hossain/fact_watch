import 'package:fact_watch/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:fact_watch/networking/background_task.dart';
import 'package:background_fetch/background_fetch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "MainNavigator");
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    BackgroundFetch.registerHeadlessTask(
        BackgroundTask.backgroundFetchHeadlessTask);

    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => SplashScreen(),
      },
      initialRoute: '/',
    );
  }
}
