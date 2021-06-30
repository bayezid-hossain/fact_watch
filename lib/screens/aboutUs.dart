import 'package:flutter/material.dart';

import 'howWeWork.dart';

class AboutUs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: SafeArea(child: Scaffold(

        appBar:  TabBar(

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
                padding: EdgeInsets.fromLTRB(5,0,0,0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  SizedBox(height: 10,),
                  Center(child: Text("আমাদের সম্পর্কে",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
                  SizedBox( height:15),
                    Text("ফ্যাক্ট ওয়াচ কী/কারা",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("বাংলাদেশে মিডিয়া ইনফরমেশন লিটারেসি বা যোগাযোগ মাধ্যমের তথ্য সাক্ষরতা তৈরিতে একটি পথিকৃত কেন্দ্র ফ্যাক্টওয়াচ। আমাদের লক্ষ্য ভুল তথ্য, অপতথ্য, ভুয়া খবর এবং গুজবের বিষয়ে জনসচেতনতা তৈরি করা। ২০১৭ সালের পয়লা নভেম্বর আমেরিকান সেন্টার থেকে প্রাপ্ত প্রারম্ভিক আর্থিক সহায়তায় আমাদের যাত্রা শুরু হয়।"),
                    SizedBox( height:10),
                    Text("ফ্যাক্টওয়াচ ইউনিভার্সিটি অব লিবারেল আর্টস বা ইউল্যাবের একটি প্রকল্প যার দায়িত্বে আছে  সেন্টার ফর ক্রিটিকাল এন্ড কোয়ালিটেটিভ স্টাডিজ (সিকিউএস)- । ইউল্যাব ‘ইউনিভার্সিটি অব লিবারেল আর্টস ফাউন্ডেশন’-এর মধ্যমে ২০০৪ সালে স্থাপিত একটি বেসরকারি বিশ্ববিদ্যালয়, যা একটি অলাভজনক প্রতিষ্ঠান হিসেবে নিবন্ধিত।"),
                    SizedBox( height:10),
                    Text("আমাদের লক্ষ্য ও উদ্দেশ্য",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("আমরা চাই ব্যক্তির বিশ্লেষণী চিন্তাশক্তির বিকাশ, যাতে তারা বিভিন্ন সংবাদ এবং সামাজিক যোগাযোগ মাধ্যমে পাওয়া তথ্যের বিশ্বাসযোগ্যতা এবং নির্ভরযোগ্যতা যাচাই করতে পারে; চারপাশের জগত্‍ বিষয়ে তাদের সচেতনতা হয়ে ওঠে আরও প্রখর। আমাদের দীর্ঘমেয়াদী উদ্দেশ্য নিজের জীবন এবং সমাজ বিষয়ে মানুষ যেন সচেতন সিদ্ধান্ত নিতে পারে।"),
                    SizedBox( height:10),
                    Text("আমরা তথ্য যাচাই এর মধ্যমে নতুন প্রজন্মের সাংবাদিক গড়ে তুলতে চাই যারা ভুল তথ্য, অপতথ্য, ভুয়া খবর এবং গুজবের গোমর ফাঁস করে জনসচেতনতা তৈরি করবে। বাংলাদেশে তথ্য, সংবাদ ও যোগাযোগ মাধ্যমের সাক্ষরতা  বিষয়ে নেতৃত্ব দেবে তারা।"),
                    SizedBox( height:10),
                    Text("আমরা কী কী করি",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("আমরা বিশ্ববিদ্যালয়ের আগ্রহী শিক্ষার্থীদের প্রশিক্ষনের মধ্যমে তাদেরকে ব্যক্তিগত এবং পেশাগত পর্যায়ে অপতথ্যের সাথে লড়াই করতে প্রস্তুত করি। একাধিক কর্মশালা এবং প্রশিক্ষণ কর্মসূচির মধ্যমেণ্টরা রাজনীতিবিদ এবং বিভিন্ন জনগুরুত্বপূর্ণ মানুষজনের কথা বা বিবৃতি, সামাজিকও যোগাযোগ মধ্যমে ছড়িয়ে পড়া বিভিন্ন খবরাখবর, মূলধারার সংবাদ মধ্যমে প্রকাশিত হওয়া বিভিন্ন খবর ইত্যাদি বিশ্লেষণে দক্ষ হয়ে ওঠে তারা।"),
                    SizedBox( height:10),
                    Text("আমরা একটি ওয়েবসাইট এবং ফেইসবুক পেইজ চালাই যার মধ্যমে আমাদের তথ্য যাচাই এর ফলাফল আমরা সবার কাছে পৌছে দিতে পারি। আমরা বিভিন্ন কর্মশালা, সেমিনার, পাবলিক লেকচার ইত্যাদি আয়োজন করে থাকি।"),
                    SizedBox( height:10),
                    Text("অদূর ভবিষ্যতে আমাদের কাজে জনসাধারন/পাঠকের অংশগ্রহণ বাড়াতে চাই। বাংলাদেশের সবচেয়ে জনপ্রিয় সামাজিকও যোগাযোগ মাধ্যম ফেইসবুক এবং ভিডিও শেয়ারিং এপ ইউটিউবে আমাদের উপস্থিতি আছে। হোয়াটসএপ, টুইটার, টিকটক, এবং ইন্সটাগ্রামেও আমরা কার্যক্রম বিস্তৃত করতে চাই।  পেশাদার লোকবল বৃদ্ধির মধ্যমে আমরা আমাদের কাজের দক্ষতা এবং ক্ষিপ্রতা দুইয়ের-ই উন্নতি করবার আশা রাখি। এর মাধযমে আমরা আরও বেশি শিক্ষার্থীকেও প্রশিক্ষণ দিতে সক্ষম হব। আমরা অন্যান্য সামাজিকও সংগঠন, তৃণমূল এনজিও, এবং বিশ্ববিদ্যালয়ের সাথে সহযোগিতার ভিত্তিতে জনগুরুত্বপূর্ণ বিষয়ে আরো বেশি কাজ করতে চাই এবং আমাদের কাজের পরিসর বিস্তৃত করতে চাই।"),
                    SizedBox( height:10),
                    Text("কীভাবে ফ্যাক্ট চেকিং করি আমরা",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("কাজের বেলায় পয়লা ধাপে আমরা বাছাই করি, কোন কোন জিনিস নিয়ে আমরা কাজ করবো। যেসব বিষয়ে অনেক ধোয়াশা, এদিক-ওদিক-সেদিক কয়েক ধরনের তথ্য পাওয়া যাচ্ছে, সিদ্ধান্ত নিতে মুশকিলে পড়ছেন জনগণ, তেমন সব বিষয় নিয়েও কাজ করি আমরা। আমরা যাচাই করার জন্য বিভিন্ন রকম দাবি বা তথ্য বাছাই করি এসব ক্ষেত্র থেকে:"),
                    SizedBox( height:10),
                    Padding(padding: EdgeInsets.fromLTRB(30,0,0,0),child: Text("¤ রাজনীতিবিদ এবং বিভিন্ন জনগুরুত্বপূর্ণ মানুষজনের কথা বা বিবৃতি"),),
                    SizedBox( height:10),
                    Padding(padding: EdgeInsets.fromLTRB(30,0,0,0),child: Text("¤ সামাজিকও যোগাযোগ মধ্যমে ছড়িয়ে পড়া বিভিন্ন খবরাখবর"),),
                    SizedBox( height:10),
                    Padding(padding: EdgeInsets.fromLTRB(30,0,0,0),child: Text("¤ মূলধারার সংবাদ মধ্যমে প্রকাশিত হওয়া বিভিন্ন খবর"),),
                    SizedBox( height:10),
                    Text("আমরা ঐ সব বিষয়ে দেশী বিদেশী ওয়েবসাইট, সংবাদপত্রের প্রতিবেদন, গবেষণাপত্র, প্রবন্ধ-নিবন্ধ, সোশ্যাল মিডিয়ায় পোস্ট, বিশেষজ্ঞ বা বিভিন্ন জনগুরুত্বপূর্ণ মানুষজন আর  রাজনীতিবিদের বক্তব্য, প্রেস-রিলিজ ইত্যাদি যাচাই-বাছাই শুরু করি। যাচাই-বাছাই বা গবেষণা কাজে আমরা ভরসা করার মতো অনলাইন এবং অফলাইনে পাওয়া উত্স ব্যবহার করি। আমরা যথাসম্ভব প্রাথমিক উত্সের ওপর নির্ভর করি।"),
                    SizedBox( height:10),
                    Text("যেকোন তথ্য বা দাবির সত্যতা যাচাই করতে আমরা এর পক্ষে বিপক্ষে দুইদিকেই সাক্ষ্য-সাবুদ-আলামত জড়ো করে তুলনা করি। প্রয়োজনীয় গবেষণা সম্পন্ন করা সাপেক্ষে আমরা ঐ সংবাদটির সত্য/মিথ্যা সংক্রান্ত সিদ্ধান্ত গ্রহণ করি। এই পুরো প্রক্রিয়াটিকে আমাদের সিদ্ধান্ত সহ একটি প্রতিবেদনে রূপ দেই আমরা। প্রতিবেদন প্রকাশের ক্ষেত্রে ফ্যাক্টওয়াচ সর্বোচ্চ পরিমাণ স্বচ্ছতা নিশ্চিত করে।"),
                    SizedBox( height:10),
                    Text("কোন একটা প্রতিবেদন আমাদের ওয়েবসাইটে ছাপা হবার পরে সেই বিষয়ে আমরা যদি নতুন তথ্য-প্রমাণ দেখতে পাই, আমরা তখনই সেগুলি যাচাই-বাছাই শুরু করি এবং দরকারে ব্যাখ্যাসহ শুধরে নেই ও তা স্পষ্টভাবে ওয়েবসাইটে জানিয়ে রাখি।"),
                    SizedBox( height:10),
                    Row(children: [
                      Text("এ বিষয়ে বিস্তারিত জানতে দেখুন: "),
                      TextButton(onPressed: (){}, child: Text(
                        " আমাদের কাজের পদ্ধতি",style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],),
                    SizedBox( height:10),

                  ],),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5,0,0,0),
                child: Column(mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Center(child: Text("About Us",style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),)),
                    SizedBox( height:15),
                    Text("What is FactWatch?",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("As a pioneer in its field, FactWatch is a center for promoting Media Information Literacy (MIL) and raising awareness about misinformation, disinformation, fake news and rumors in Bangladesh. The center was established at the University of Liberal Arts Bangladesh (ULAB) on November 1, 2017 with initial funding from the American Center that covered the costs for the first year."),
                    SizedBox( height:10),
                    Text("FactWatch is managed by the Center for Critical and Qualitative Studies (CQS) at ULAB. ULAB is a private university registered as a non-profit, founded in 2004 by the University of Liberal Arts Foundation."),
                    SizedBox( height:10),
                    Text("Our Mission",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("The center is committed to teaching individuals develop critical thinking skills to enable them to better identify and judge the reliability and credibility of information they encounter through various mass media and social media platforms, and to become better informed about the world in which they live.In the long run, we aim to help people make well-informed decisions about their lives and society."),
                    SizedBox( height:10),
                    Text("To prepare a generation of skilled fact checkers who will be leaders in debunking fake news, misinformation, disinformation in the news media industry in Bangladesh, and will be the leaders in promoting media literacy, news literacy and data literacy in the country."),
                    SizedBox( height:10),
                    Text("What we do",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("We train highly motivated students so that they can combat falsehood in their real life and in the industry. Through multiple workshops and training sessions, they become skilled in analyzing statements made by public figures and politicians; false information that spreads through the social media and fabricated news items published by the mainstream media and publications."),
                    SizedBox( height:10),
                    Text(" We run a website and facebook page to share our fact-checking work with the public. We hold workshops, seminars, and public lectures on Media Information Literacy (MIL), fake news, misinformation, disinformation, falsehood and rumors."),
                    SizedBox( height:10),
                    Text("Over the coming year, we hope to increase our reach by better engaging our audience . Although Facebook and YouTube have been the most used social media in Bangladesh, and we limited our activities on these platforms so far, in the coming days we have to take a multiplatform approach by extending our presence to Twitter, WhatsApp, Instagram and TikTok. We would also like to increase editorial and research capacity by hiring a few more professional team members, who will in turn, mentor additional student interns, and run the website more efficiently and detect rumors at their earliest stages. We hope to partner with non-profit civil society organizations, grassroot NGOs, and universities to benefit from their reach and expertise while collaborating on fact-checking of issues of public interest."),
                    SizedBox( height:10),
                    Text("How our fact-checking works",style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                    SizedBox( height:10),
                    Text("First of all, we select what we are going to fact check. We concentrate on claims of public interest that have the potential to confuse people and influence their decision making. We look for claims by scanning: "),
                    SizedBox( height:10),
                    Padding(padding: EdgeInsets.fromLTRB(30,0,0,0),child: Text("¤ Statements and quotes from politicians and other influential public figures"),),
                    SizedBox( height:10),
                    Padding(padding: EdgeInsets.fromLTRB(30,0,0,0),child: Text("¤ Posts and claims being shared on social media"),),
                    SizedBox( height:10),
                    Padding(padding: EdgeInsets.fromLTRB(30,0,0,0),child: Text("¤ News published on mainstream media"),),
                    SizedBox( height:10),
                    Text("We then explore relevant information on local and global websites, news reports, research papers, social media discussions, opinion from experts and other important persons, press releases to find the facts. We always depend on credible online and offline sources. We utilize primary sources anytime they are available."),
                    SizedBox( height:10),
                    Text("We consider evidence from both sides of the story after our research is done. We then rate the claim on its truthfulness/falsehood. We document this entire process in a fact-checking report for our website. We also add notes on how we found evidence in our report so that our fact checking procedure and what tools we used is clear to readers. "),
                    SizedBox( height:10),
                    Text("After a report has been published, if we find significant new information/evidence about the story, we consider the new evidence and update our report if necessary, making the changes clear to our readers."),
                    SizedBox( height:10),
                    Row(children: [
                      Text("For details about our methodology, please see: "),
                      TextButton(onPressed: (){Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HowWeWork()));
                      }, child: Text(
                        " How we work",style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                    ],),
                    SizedBox( height:10),

                  ],),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
