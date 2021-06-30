import 'package:flutter/material.dart';

class OurTeam extends StatelessWidget {

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
              child: Padding(
                padding: EdgeInsets.fromLTRB(10, 0,0,0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Image.asset('apon.jpg'),
                        Text("SDFSKDLFJSLKDFJSLKDJFLKSDJFKLSDJFLSKDFLSDJFLKSDJFLKSJDFSDFJLSDJFSDF"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(),
            )
          ],
        ),
      )),
    );
  }
}
