import 'package:flutter/material.dart';

class HowWeFund extends StatelessWidget {

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
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding:EdgeInsets.all(10),child: Text("অর্থকড়ি কীভাবে আসে ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'Kalpurush'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("আর্থিক সহায়তা  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Kalpurush'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("ঢাকার আমেরিকান সেন্টার থেকে ২০১৭ সালে ১ বছরের বাজেট হিসেবে ২৫০০০ মার্কিন ডলার পেয়ে Fact-Watch.org তার পথচলা শুরু করেছে। আমেরিকান সেন্টার একটি অরাজনৈতিক প্রতিষ্ঠান যা অপতথ্যের বিরুদ্ধে লড়াই করতে সংকল্পবদ্ধ। ২০১৮ সালের শেষ থেকে বর্তমানে ফ্যাক্ট ওয়াচ বাইরের কোন আর্থিক সহায়তা ছাড়াই মিডিয়া স্টাডিজ এবং জার্নালিজ্ম বিভাগের সহায়তার কার্যক্রম চালিয়ে যাচ্ছে ।",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,fontFamily: 'Kalpurush'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("অনুদান  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Kalpurush'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("আমাদের নিরপেক্ষতা ও ন্যায্যতায় হস্তক্ষেপ না করলে আমরা আমরা আমদেরকে সহযোগিতা করতে আগ্রহী ব্যক্তি এবং অরাজনৈতিক প্রতিষ্ঠানের কাছ থেকে অনুদান নিতে সম্মত। দাতাপক্ষ আমাদের স্বাধীনতা, কার্যপদ্ধতির মান ও স্বচ্ছতাতেও কোন অবস্থায় ব্যাঘাত ঘটতে পারবে না।",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,fontFamily: 'Kalpurush'),)),

                ],
              )
            ),

            SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ Padding(padding:EdgeInsets.all(10),child: Text("HOW WE FUND OUR WORK",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,fontFamily: 'BalooDa2'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("Funding ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'BalooDa2'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("We started this initiative with a USD 25,000.00 support from the American Center, Dhaka that covered the operational costs for the first year. The American Centre is a non-political entity committed to fighting against misinformation. Since 2018, FactWatch has been sustaining itself without external funding, utilizing resources from the Media Studies and Journalism Department at ULAB.",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,fontFamily: 'Kalpurush'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("Donations  ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,fontFamily: 'Kalpurush'),)),
                  Padding(padding:EdgeInsets.all(10),child: Text("We are open to donations from the public and non-political organizations interested ইন supporting our work, as long as our principles of non-partisanship and fairness are not compromised. Neither should donors expect to influence our claim selection or decision making in any shape or form. We reserve our independence and the standards and transparency of our methodology under all circumstances.",style: TextStyle(fontWeight: FontWeight.normal,fontSize: 16,fontFamily: 'Kalpurush'),)),
                ],
              )
            ),
          ],
        ),
      )),
    );
  }
}
