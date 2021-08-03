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
              child: Text("বাংলা",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'BalooDa2'),),

            ),Tab(
              child: Text("English",style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: 'BalooDa2'),),
            )
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Html(data: ccBangla,onLinkTap: (url,_,__,___) {
                Functionalities.launchURL(url!);
              },
                style: {
                  'p':Style(
                    fontFamily: "HindSiliguri",
                  ),'li':Style(
                    fontFamily: "HindSiliguri",
                  ),

                  'h1':Style(
                      fontFamily: "BalooDa2"
                  ),
                  'h2':Style(
                      fontFamily: "BalooDa2"
                  ),
                  'h3':Style(
                      fontFamily: "BalooDa2"
                  ),
                  'h4':Style(
                      fontFamily: "BalooDa2"
                  ),
                  'a':Style(
                      fontFamily: "HindSiliguri"
                  )
                },

              ),
            ),

            SingleChildScrollView(
              child: Html(data: ccEnglish,onLinkTap: (url,_,__,___) {
                Functionalities.launchURL(url!);
              },
                style: {
              'p':Style(
              fontFamily: "HindSiliguri",
              ),'li':Style(
              fontFamily: "HindSiliguri",
              ),

              'h1':Style(
              fontFamily: "BalooDa2"
              ),
              'h2':Style(
              fontFamily: "BalooDa2"
              ),
              'h3':Style(
              fontFamily: "BalooDa2"
              ),
                  'h4':Style(
                      fontFamily: "BalooDa2"
                  ),
                  'h5':Style(
                      fontFamily: "BalooDa2",
                  ),
              'a':Style(
              fontFamily: "HindSiliguri"
              )
              },),
            ),
          ],
        ),
      )),
    );
  }
}
