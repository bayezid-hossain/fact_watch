import 'package:fact_watch/screens/homePage.dart';
import 'package:fact_watch/screens/userInfoPage.dart';
import 'package:flutter/material.dart';

class FirstRunUserInfoPage extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage())); },
          child: Text(
            "Skip"
          ),
        ),
      ),
      body: UserInfoPage(comment: false,),
    ));
  }
}
