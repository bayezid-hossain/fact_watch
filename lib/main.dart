// @dart=2.9

import 'dart:convert';
import 'dart:typed_data';

import 'package:fact_watch/functions/functionalities.dart';
import 'package:fact_watch/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'models/News.dart';

void notificationPermission()async{
  NotificationSettings settings=await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true
  );
}
const AndroidNotificationChannel channel = AndroidNotificationChannel(
    '1', // id
    'High Importance Notifications', // title
    'This channel is used for important notifications.', // description
    importance: Importance.high,
    playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
var androidSettings=AndroidInitializationSettings("@mipmap/ic_launcher");
var iosSettings=IOSInitializationSettings(requestAlertPermission: false,requestBadgePermission: false,requestSoundPermission: false);
var initSettings=InitializationSettings(android: androidSettings,iOS: iosSettings);

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  if(Firebase.apps.length==0)await Firebase.initializeApp();
  print('A bg message just showed up :  ${message.messageId}');

  if (message.data['id']!=null) {

    News newNews;
    bool update=await Functionalities.checkIfUpdate(int.parse(message.data['id']));

    if(update==false){
      newNews = await Functionalities.getSingleNews(int.parse(message.data['id']));

    }
    else {
      await Functionalities.updatePost(int.parse(message.data['id']));
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
  }
}

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  notificationPermission();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "MainNavigator");

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    //
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
    //   print('A new onMessageOpenedApp event was published!');
    //   RemoteNotification notification =
    //       message.notification as RemoteNotification;
    //   AndroidNotification android =
    //       message.notification?.android as AndroidNotification;
    //   if (notification != null && android != null) {
    //     News newNews =
    //         await Functionalities.getSingleNews(int.parse(notification.body));
    //     final ByteArrayAndroidBitmap largeIcon = ByteArrayAndroidBitmap(
    //         await _getByteArrayFromUrl(
    //             'https://dev.factwatch.org/wp-content/uploads/2021/06/FactWatch_Logo1.png'));
    //     final ByteArrayAndroidBitmap bigPicture = ByteArrayAndroidBitmap(
    //         await _getByteArrayFromUrl(newNews.mediaLinkLarge));
    //
    //     final BigPictureStyleInformation bigPictureStyleInformation =
    //         BigPictureStyleInformation(bigPicture,
    //             largeIcon: largeIcon,
    //             contentTitle: '<p>${newNews.title}</p>',
    //             htmlFormatContentTitle: true,
    //             summaryText: '<p>${newNews.excerpt}</p>',
    //             htmlFormatSummaryText: true);
    //     flutterLocalNotificationsPlugin.show(
    //         notification.hashCode,
    //         newNews.title,
    //         newNews.excerpt,
    //         NotificationDetails(
    //           android: AndroidNotificationDetails(
    //             channel.id,
    //             channel.name,
    //             channel.description,
    //             color: Colors.blue,
    //             playSound: true,
    //             icon: '@mipmap/ic_launcher',
    //             styleInformation: bigPictureStyleInformation,
    //           ),
    //         ),payload: jsonEncode(newNews));
    //   }
    // });
    return MaterialApp(
      navigatorKey: MyApp.navigatorKey,
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

Future<Uint8List> _getByteArrayFromUrl(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}
