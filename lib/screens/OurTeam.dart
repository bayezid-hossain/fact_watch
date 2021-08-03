import 'package:fact_watch/functions/functionalities.dart';
import 'package:flutter/material.dart';
import 'package:fact_watch/functions/constants.dart';
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
              child: Text("বাংলা",style: TextStyle(color: Colors.black,fontSize: 16,fontFamily: 'BalooDa2'),),

            ),Tab(
              child: Text("English",style: TextStyle(color: Colors.black,fontSize: 15,fontFamily: 'BalooDa2'),),
            )
          ],
        ),
        body: TabBarView(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                      Center(
                        child: AspectRatio(
                          aspectRatio: 16/9,
                          child: Image.asset(
                            "assets/sumon_rahman.jpg",
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Padding(padding:EdgeInsets.only(left: 10),child: Text("সুমন রহমান",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                      SizedBox( height:15),
                      Padding(padding:EdgeInsets.only(left: 10),child: Text("পরিচালক এবং প্রতিষ্ঠাতা সম্পাদক",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                      SizedBox( height:10),
                      Padding(padding:EdgeInsets.only(left: 10),child: Text("ইউনিভার্সিটি অব লিবারেল আর্টস-এর গণমাধ্যম ও সাংবাদিকতা বিভাগের অধ্যাপক। অফিস অব ফ্যাকাল্টি রিসার্চ-এর পরিচালক। সেন্টার ফর ক্রিটিক্যাল এন্ড কোয়ালিটেটিভ স্টাডিজ এর পরিচালক। গণমাধ্যম এবং সাংবাদিকতা  বিষয়ে বিশেষজ্ঞ হিসেবে সুপরিচিত। বাংলাদেশে মিডিয়া ও ইনফরমেশন লিটারেসি নিয়ে আলাপের প্রবক্তা। ",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("পড়াশুনা করেছেন দর্শন, উন্নয়ন-অধ্যয়ন ও দক্ষিণ এশীয় অধ্যয়নে। পিএইচডি করেছেন সাংস্কৃতিক অধ্যয়নে, ইউনিভার্সিটি অব কুইনসল্যান্ড, অস্ট্রেলিয়া থেকে। পপুলার কালচার, কালচারাল স্টাডিজ এবং সাহিত্যের বিভিন্ন শাখায় সুমন রহমানের লেখালেখি আছে।",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Row(children:[Padding(padding:EdgeInsets.only(left: 10),child: Text("তাঁর সাথে যোগাযোগ করতে ইমেইল: ",style: TextStyle(fontFamily: 'HindSiliguri'),),),InkWell(
                    onTap: () {
                      Functionalities.launchURL("mailto:sumon.rahman@ulab.edu.bd");
                    },
                    child: Text(
                      "sumon.rahman@ulab.edu.bd",
                      style: TextStyle(fontSize: 14,decoration: TextDecoration.underline),
                    ),
                  ),],),
                  SizedBox( height:10),

                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/nafees_mansoor.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("নাফিস মনসুর",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("প্রযুক্তি সম্পাদক",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ড. নাফিস মনসুর ইউল্যাবের কম্পিউটার বিজ্ঞান ও প্রকৌশল বিভাগের সহযোগী অধ্যাপক। তিনি ইউনিভার্সিটি টেকনোলজি মালয়শিয়া থেকে পিএইচডি ডিগ্রি অর্জন করেছেন। তিনি ফ্যাক্ট ওয়াচের সদস্যদের বিভিন্ন তথ্যপ্রযুক্তিগত বিষয়ে, যেমন ওয়েব পেইজের রক্ষণাবেক্ষণ এবং ফ্যাক্ট চেকিং এ প্রযুক্তির ব্যবহার বিষয়ে পরামর্শ দিয়ে থাকেন। ",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ড. মনসুরের শিক্ষকতা এবং প্রকৌশলে এক দশকের বেশি অভিজ্ঞতা রয়েছে । বিভিন্ন জার্নাল এবং কনফারেন্স মিলিয়ে প্রকাশনার সংখ্যা ৬০ এর বেশি। ",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Row(children:[Padding(padding:EdgeInsets.only(left: 10),child: Text("তাঁর সাথে যোগাযোগ করতে ইমেইল: "),),InkWell(
                    onTap: () {
                      Functionalities.launchURL("mailto:nafees.mansoor@ulab.edu.bd");
                    },
                    child: Text(
                      "nafees.mansoor@ulab.edu.bd",
                      style: TextStyle(fontSize: 14,decoration: TextDecoration.underline),
                    ),
                  ),],),
                  SizedBox( height:10),



                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/sams.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("সামস ওয়াহিদ সাহাত",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ফ্যাক্ট চেকার",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ইউল্যাবের মিডিয়া স্টাডিজ ও জার্নালিজম বিভাগের গণযোগাযোগ বিষয়ে পড়ছেন। ফ্যাক্ট চেকিং এ প্রযুক্তি, পরিসংখ্যান এবং উপাত্তের ভূমিকা নিয়ে বিশেষ আগ্রহী।",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),


                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/apon.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("আপন দাস ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ফ্যাক্ট চেকার",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ইউল্যাবের মিডিয়া স্টাডিজ ও জার্নালিজম বিভাগের তৃতীয় বর্ষে অধ্যয়নরত। পড়তে এবং লিখতে ভালবাসেন। বিভিন্ন দৈনিকে তার লেখা প্রবন্ধ প্রকাশিত হয়েছে। ভবিষ্যতে অপতথ্য়, গুজব, ভুয়া খবর নিয়ে গবেষণা করতে আগ্রহী।",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),


                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/sadeeq.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("জহিরুল ইসলাম",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("ফ্যাক্ট চেকার",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("জহিরুল ইসলাম পেশাগত জীবনে মেকানিক্যাল ইঞ্জিনিয়ার হলেও রহস্য ও ফ্যাক্টচেকিং নিয়ে বিশেষ আগ্রহী। ২০২১ বাংলা একাডেমি বইমেলায় ‘মীমাংসিত রহস্য’ নামে তাঁর একটি বই প্রকাশিত হয়েছে। শিক্ষাজীবনে তিনি বাংলাদেশ প্রকৌশল বিশ্ববিদ্যালয় এবং ঢাকা বিশ্ববিদ্যালয়ে অধ্যয়ন করেছেন। অনলাইনে নিয়মিতভাবে গুজব এবং কুসংস্কারের বিরুদ্ধে লেখালেখি করছেন দীর্ঘদিন ধরে।",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:40),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Divider(),
                      SizedBox(height: 20,),
                      Expanded(
                        child: buildCard(),
                      ),
                      Expanded(
                        child: buildImages(),
                      )
                    ],
                  ),

                ],
                  ),
              ),

            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/sumon_rahman.jpg",
                        fit: BoxFit.fitHeight,
                        height: 180,
                        width: 640,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Din M Sumon Rahaman",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Director and Founding Editor",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Professor of Journalism and Media Studies at ULAB and director of the Office of Faculty Research and the Center for Critical and Qualitative Studies (CQS). He is an esteemed media expert and a pioneer in the field of information literacy. ",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Dr. Rahman’s academic background is in Philosophy, Development Studies and South Asian Studies, with a PhD in Cultural Studies from the University of Queensland, Australia. As a writer, he has published on popular culture, cultural studies, as well as works of literature.",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Row(children:[Padding(padding:EdgeInsets.only(left: 10),child: Text("He can be reached at: "),),InkWell(
                    onTap: () {
                      Functionalities.launchURL("mailto:sumon.rahman@ulab.edu.bd");
                    },
                    child: Text(
                      "sumon.rahman@ulab.edu.bd",
                      style: TextStyle(fontSize: 14,decoration: TextDecoration.underline),
                    ),
                  ),],),
                  SizedBox( height:10),

                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/nafees_mansoor.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Nafees Mansoor",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Technical Editor",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Dr. Nafees Mansoor is an Assistant Professor in the Department of Computer Science and Engineering at ULAB with a Ph.D. from Universiti Teknologi Malaysia (UTM). He advises the FactWatch team on the technical maintenance of platforms as well as the use of technology in fact-checking.",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Dr. Mansoor has more than 10 years work experience both in academia and industry. He has published at least 60 research articles in various reputed journals and international conferences. ",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),
                  Row(children:[Padding(padding:EdgeInsets.only(left: 10),child: Text("He can be reached at: "),),InkWell(
                    onTap: () {
                      Functionalities.launchURL("mailto:nafees.mansoor@ulab.edu.bd");
                    },
                    child: Text(
                      "nafees.mansoor@ulab.edu.bd",
                      style: TextStyle(fontSize: 14,decoration: TextDecoration.underline),
                    ),
                  ),],),
                  SizedBox( height:10),



                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/sams.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Sams Wahid Shahat",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Fact Checker",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Sams is studying Public Relations at ULAB. He is particularly interested in the use of technology and data in fact-checking.")),
                  SizedBox( height:10),


                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/apon.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Apon Das ",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Fact Checker",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Apon has is a student of Media Studies & Journalism at ULAB. He loves to read and write. He has published articles in several national dailies. Apon would like to pursue academic research into misinformation, disinformation, rumors, and fake news.",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:10),


                  Center(
                    child: AspectRatio(
                      aspectRatio: 16/9,
                      child: Image.asset(
                        "assets/sadeeq.jpg",
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Jahirul Islam",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:15),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Fact Checker",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold,fontFamily: 'BalooDa2'),)),
                  SizedBox( height:10),
                  Padding(padding:EdgeInsets.only(left: 10),child: Text("Though Jahirul Islam is a Mechanical Engineer by profession, he has a special interest in Mystery solving and Fact-checking. In the 2021 Ekushey book fair, his first book “Meemangshito rohosso” (Solved Mysteries) was published. In academic life, he studied in BUET (Bangladesh University of Engineering & Technology) & University of Dhaka. He has a strong voice in Bangla online world against superstition,rumour & fake news.",style: TextStyle(fontFamily: 'HindSiliguri'),)),
                  SizedBox( height:40),
                  Row(
                    // mainAxisSize: MainAxisSize.max,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(),
                      Divider(),
                      SizedBox(height: 20,),
                      Expanded(
                        child: buildCard(),
                      ),
                      Expanded(
                        child: buildImages(),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

