import 'package:fact_watch/functions/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fact_watch/functions/functionalities.dart';
class CCPolicy extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: SafeArea(child: Scaffold(
        appBar: TabBar(

          tabs: [
            Tab(
              child: Text("বাংলা",style: TextStyle(color: Colors.black,fontSize: 16),),

            ),Tab(
              child: Text("English",style: TextStyle(color: Colors.black,fontSize: 15),),
            )
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Html(data: ccBangla,onLinkTap: (url,_,__,___) {
                Functionalities.launchURL(url!);
              },

              ),
            ),

            SingleChildScrollView(
              child: Html(data: ccEnglish,onLinkTap: (url,_,__,___) {
                Functionalities.launchURL(url!);
              },),
            ),
          ],
        ),
      )),
    );
  }
}
