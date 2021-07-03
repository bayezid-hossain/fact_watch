import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:fact_watch/functions/constants.dart';
class NonPartisanship extends StatelessWidget {

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
              child: Html(data: nonPartisanBanglaDescription,

              ),
            ),

            SingleChildScrollView(
              child: Html(data: nonPartisanEnglishDescription,),
            ),
          ],
        ),
      )),
    );
  }
}
