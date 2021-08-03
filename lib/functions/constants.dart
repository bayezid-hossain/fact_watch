import 'package:fact_watch/screens/categorizedNewsPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fact_watch/screens/aboutUs.dart';
import 'package:fact_watch/screens/CCPolicy.dart';
import 'package:fact_watch/screens/howWeWork.dart';
import 'package:fact_watch/screens/nonPartisanship.dart';
import 'package:fact_watch/screens/OurTeam.dart';
import 'functionalities.dart';
import 'package:fact_watch/screens/howWeFund.dart';
Icon getIcon(IconData icon) {

  return Icon(icon, size: 25, color: Colors.black);
}

InkWell getNormalRow(String text, VoidCallback function, [ bool subMenu = false]) {
  return InkWell(
    onTap: function,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: subMenu ? 14 : 16,fontFamily: "BalooDa2"),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
      ],
    ),
  );
}

Drawer getDrawer(BuildContext context) {
  return Drawer(
    elevation: 10,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10, right: 10, bottom: 5),
            child: Row(
              children: [
                InkWell(
                  child: getIcon(Icons.clear),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  "Fact-Watch",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "BalooDa2"
                  ),
                ),
                InkWell(
                  child: getIcon(Icons.settings),
                  onTap: () {},
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ),
        Divider(
          height: 20,
          color: Colors.blue,
        ),
        getNormalRow("হোম", () {Navigator.pop(context);}),
        getNormalRow("তথ্য যাচাই", () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CategorizedNews(2)));
        }
  ),
        // ExpansionTile(
        //   initiallyExpanded: true,
        //   childrenPadding: EdgeInsets.only(left: 18),
        //   tilePadding: EdgeInsets.only(left: 10),
        //   title: Text(
        //     "ফ্যাক্ট ফাইল",
        //     style: TextStyle(
        //       fontSize: 16,
        //       fontWeight: FontWeight.normal,
        //     ),
        //   ),
        //   children: [
        //     getNormalRow("তথ্য যাচাই", () {}, true),
        //     getNormalRow("বিজ্ঞাপন যাচাই", () {}, true),
        //     getNormalRow("লেখাজোখা", () {}, true),
        //   ],
        // ),
        getNormalRow("ফ্যাক্ট ফাইল",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategorizedNews(3)));}),
             getNormalRow("স্বাস্থ্য", () {Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CategorizedNews(14)));}),
        getNormalRow("লেখাজোখা",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategorizedNews(10)));}),
        ExpansionTile(
          initiallyExpanded: true,
          childrenPadding: EdgeInsets.only(left: 18),
          tilePadding: EdgeInsets.only(left: 10),
          title: Text(
            "করোনা মহামারি",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.normal,
            ),
          ),
          children: [
            getNormalRow("করোনা তথ্য যাচাই", () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategorizedNews(6)));}, true),
            getNormalRow("করোনা ভাক্সিন", () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategorizedNews(9)));}, true),
            getNormalRow("জন উদ্যোগ", () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategorizedNews(7)));}, true),
            getNormalRow("জরুরি পরামর্শ", () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategorizedNews(8)));}, true),
          ],
        ),
        Divider(
          height: 20,
          color: Colors.blue,
        ),

        getNormalRow("আমাদের সম্পর্কে",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => AboutUs()));}),
        getNormalRow("ফ্যাক্টওয়াচ টিম",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => OurTeam()));}),
        getNormalRow("কাজের পদ্ধতি",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => HowWeWork()));}),
        getNormalRow("নিরপেক্ষতা নীতি",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => NonPartisanship()));}),
        getNormalRow("সংশোধন ও অভিযোগ নীতি",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => CCPolicy()));}),
        getNormalRow("অর্থকড়ি আসে কিভাবে",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => HowWeFund()));}),
      ],
    ),
  );
}


Widget buildCard() => Column(
  mainAxisAlignment: MainAxisAlignment.end,
  children: [
    // ListTile(
    //   title: Text(
    //     "যোগাযোগ",
    //     style: TextStyle(
    //       fontWeight: FontWeight.bold,
    //       fontSize: 20,
    //     ),
    //     textAlign: TextAlign.left,
    //   ),
    // ),
    // Divider(),
    ListTile(
      title: Transform.translate(
        offset: Offset(-10, 0),
        child: InkWell(
          onTap: () {
            Functionalities.launchURL(
                "https://goo.gl/maps/nnuzsLUbQH1ezHfK9");
          },
          child: Text('বাড়ি# ৫৬,\nরোড # ৪/এ, \nসাতমসজিদ রোড,\nধানমন্ডি',
              style: TextStyle(fontWeight: FontWeight.w500)),
        ),
      ),
      subtitle: Transform.translate(
          offset: Offset(-10, 0), child: Text('ঢাকা -1209, বাংলাদেশ')),
      leading: Icon(
        Icons.map,
        color: Colors.blue[500],
        size: 25,
      ),
    ),
    Divider(),
    ListTile(
      title: InkWell(
        onTap: () {
          Functionalities.launchURL("tel:+88029661301");
        },
        child: Transform.translate(
          offset: Offset(-10, 0),
          child: Text('+৮৮০২৯৬৬১৩০১',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ),
      ),
      leading: Icon(
        Icons.phone,
        color: Colors.blue[500],
        size: 20,
      ),
    ),
    ListTile(
      title: InkWell(
        onTap: () {
          Functionalities.launchURL("tel:+88029661255");
        },
        child: Transform.translate(
          offset: Offset(-10, 0),
          child: Text('+৮৮০২৯৬৬১২৫৫',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
        ),
      ),
      leading: Icon(
        Icons.phone,
        color: Colors.blue[500],
        size: 20,
      ),
    ),
    ListTile(
      leading: Icon(
        Icons.email_outlined,
        color: Colors.blue[500],
        size: 20,
      ),
      title: Transform.translate(
        offset: Offset(-10, 0),
        child: InkWell(
          onTap: () {
            Functionalities.launchURL("mailto:contact@fact-watch.org");
          },
          child: Text(
            "contact@fact-watch.org",
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    ),
  ],
);
// #enddocregion Card

// #docregion Stack
Widget buildImages() => Column(
  children: [
    // Text(
    //   "যোগাযোগ",
    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
    // ),
    Image.asset(
      "assets/cqs.png",
      height: 120,
      width: 120,
      color: Colors.black,
    ),
    SizedBox(
      height: 50,
    ),
    Image.asset(
      "assets/ifcn.png",
      height: 120,
      width: 120,
    ),
  ],
);
Widget buildStack() => Stack(
  alignment: const Alignment(0.6, 0.6),
  children: [
    CircleAvatar(
      backgroundImage: AssetImage('images/pic.jpg'),
      radius: 100,
    ),
    Container(
      decoration: BoxDecoration(
        color: Colors.black45,
      ),
      child: Text(
        'Mia B',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ),
  ],
);

var howWeWorkEnglishDescription="""<div class="entry-content">
<h4><b></b><b>Fact-Checking Methodology</b></h4>
<h4><strong>Selecting a claim to fact-check</strong></h4>
<p>We are a part of the University of Liberal Arts Bangladesh campus community. We recruit and train fact-checkers and interns among undergraduate students from the Media Studies and Journalism program.</p>
<p>Our <strong>Fact-checking team</strong> comprised of<strong> Fact-Checkers </strong>and <strong>interns</strong> actively monitor news and social media while keeping an eye on popular discourse for potential claims that could be fact checked. They share fact-check ideas with the <strong>Assistant Editor</strong> and <strong>Founding Editor</strong>, who approve the final selection through a team discussion.</p>
<p>The claim is selected based on a number of factors, for example:</p>
<ul>
<li>Is it important in terms of public interest?</li>
<li>Could it impact a large number of people?</li>
<li>Is it difficult for people to assess the claim? Are the facts around it unclear or ambiguous? Are the facts easy to find?</li>
<li>Is the content provocative, or sensitive, and could it potentially cause harm if left unchecked</li>
</ul>
<h4><strong>What We Do Not Cover</strong></h4>
<ul>
<li>Inconsequential glitches, such as a misspelling or slip of the tongue</li>
<li>Content that is clearly sarcastic or humorous, such as jokes, memes or hyperbole</li>
<li>Predictions and opinions that are not fact-checkable by their very nature</li>
<li>Claims that involve evidence that cannot be accessed publicly. However, if there is significant public interest in the topic we may run a full fact-check process to present our readers with available evidence but rate the fact as “Could not be verified”</li>
<li>Religious claims that require religious expertise to verify</li>
<li>Conspiracy theories, rumors, urban legends or paranormal incidents that may go viral but cannot be subjected to the fact-checking process</li>
<li>We do not cover political statements by Bangladeshi politicians unless they involve policy-level decisions and/or information with practical public impact</li>
</ul>
<h4><strong>Fact-Checking Process and Editorial Chain</strong></h4>
<p>The <strong>fact-checking team (fact-checkers and interns)</strong>&nbsp;goes through the fact-checking process detailed below with the guidance of the <strong>Lead Researcher.</strong> While the research is a team effort, one fact-checker is designated to write the fact-checking report.</p>
<p>Once the draft report is written, the <strong>Assistant Editor</strong> performs copy edits and checks the sources for accuracy, relevance, and balance. If needed, the Assistant Editor conducts an independent round of research to ensure the writer did not miss any important data points or context.</p>
<p>For Fact-Files and reports that involve review of primary academic literature or expert consultation, the <strong>Lead Researcher</strong> closely oversees the fact-checking. For cases involving information technology or when technological advise is required for the fact-chck, our <strong>Technology Advisor</strong> works closely with the fact-checking team.</p>
<p>If necessary, the writer is asked to amend the report. Once the edited report is ready, the <strong>Assistant Editor</strong> takes a final approval from the <strong>Founding Editor</strong> before publishing it on the website and Facebook page.</p>
<p>Most often than not, our fact-checking procedure automatically points towards one particular rating. However, in cases where there the Assistant Editor does not agree with the rating proposed by the writer, the issue is discussed aamong the <strong>Founding Editor, Lead Researcher, and Assistant Editor</strong> for the final decision.</p>
<h4><strong>&nbsp;</strong><strong>Fact-Checking Process</strong> <strong>and Report Writing: Step by Step</strong></h4>
<p>We go through the following steps to prepare our fact-checking report to file and publish:</p>
<ol>
<li style="list-style-type: none;">
<ol>
<li>What have we found and where? What is the claim we need to fact-check? We check screenshots and archived links to locate the claim.</li>
<li>Why is this claim being made? What is the context? If it is factual information, we gather evidence for the claim using primary sources. If it is a rumor or fake news, we observe if people are spreading it and reacting to it. Other instances of similar claims in different formats are also noted.</li>
<li>Why could this claim be challenged? We gather evidence against the claim from primary and secondary sources, conflicting information and/or reports. We also assess reliability of the source(s).</li>
<li>For both sides of the story, we look for primary sources — like information collected from contacting people directly, found on webpages and social media accounts, traceable expert opinions, scholarly literature (books and journal articles) — and secondary sources like reports from trustworthy media. For images and videos, we utilize trustworthy image assessment platforms like Google images, Tineye reverse image search etc.</li>
<li>For our fact files, we depend on primary resources, focusing on articles published in peer reviewed academic journals.</li>
<li>We are absolutely transparent about our reporting of fact-checks. We provide our complete list of sources in every report. We add notes on where we found evidence at every step as hyperlinked citations, so that our fact checking procedure and what tools we used is clear to readers. We also list the sources in a footnote. If the evidence is not easily accessible or stable, we save a screenshot for our own records and include them in our reports.</li>
<li>Once the fact checking is complete, the fact-checker involved proposes an initial rating. The editors and researcher then debate the suitable rating for the claim. Most often than not, our procedure automatically points us towards one particular rating. However, in cases where there is still any disagreement among the team, we take a vote.</li>
<li>We place our rating on the featured image of the report as well as at the beginning of the report along with a summary.</li>
</ol>
</li>
</ol>
<h4><span style="font-size: 14pt;"><b>Categories</b></span></h4>
<p>We have three generic categories and one titled Coronavirus, specifically created to address the pandemic situation.</p>
<ol>
<li style="list-style-type: none;">
<ol>
<li><strong>Internet rumors:</strong> Rumors, edited or morphed images and videos, unsubstantiated claims that are widely shared and/or viral on social media</li>
<li><strong>Fact File:</strong> These are not rumors or viral claims, but information that can be presented in misleading terms on mainstream and social media. In our Fact Files, we bring our readers credible research findings and analyses on such claims. These are further classified under, fact checks, ad checks, and other resources.</li>
<li><strong>FactWatch Video:</strong> Based on our fact-checking reports, we present easy to understand videos on issues of public interest.</li>
<li><strong>Coronavirus: </strong>This is a special category created to combat the rumors, false information, and misleading claims generated by the Coronavirus pandemic. This is further divided into three categories: Fact checks, Essential Information, and Community Initiatives. Although the latter two are not fact checks per se, they have a proactive role in keeping people safe . Therefore, we created these categories as our response to this global crisis.</li>
</ol>
</li>
</ol>
<h4><span style="font-size: 18pt;"><b>Ratings</b></span></h4>
<p>We rate our fact-checks in eight different ways:</p>

</div></div><!--end responsive_icons-->
</div>""";





var howWeWorkBanglaDescription="""<div class="entry-content">
<h4 style="text-align: justify;"><b>ফ্যাক্টওয়াচের তথ্যযাচাই পদ্ধতি</b></h4>
<p>ফ্যাক্টওয়াচ ইউনিভার্সিটি অফ লিবারেল আর্টস বাংলাদেশ (ইউল্যাব)-এর ক্যাম্পাস কমিউনিটির অংশ। আমরা &nbsp;ইউল্যাবের মিডিয়া স্টাডিজ এবং জার্নালিজম বিভাগের স্নাতক পর্যায়ের শিক্ষার্থীদের মধ্যে থেকে ফ্যাক্ট চেকার এবং ইন্টার্ন নিয়োগ করি যারা সামাজিক যোগাযোগ মাধ্যমসহ অন্যান্য মাধ্যমে প্রচারিত বিভিন্ন খবরের দিকে নজর রাখে, বিশেষ করে জনসাধারণের মধ্যে সাম্প্রতিক আলোচ্য ঘটনার দিকে।</p>
<p>আমাদের শিক্ষার্থী <strong>ফ্যাক্ট চেকার ও ইন্টার্ন বা শিক্ষানবিসরা</strong> ফ্যাক্ট চেকিং এর জন্য বিভিন্ন বিষয়বস্তু নির্বাচন করে, যা <strong>সহকারী সম্পাদক</strong> এবং <strong>প্রতিষ্ঠাতা সম্পাদকের</strong> মাধ্যমে চূড়ান্ত হয়।</p>
<p style="text-align: justify;">এসব বিভিন্ন মধ্যমে অসংখ্য দাবি উত্থাপিত হয়, যার সত্যতা সংশ্লিষ্ট তথ্য বিশ্লেষণের মধ্যমে যাচাই করা হয়। তথ্য যাচাই বা ফ্যাক্ট চেকিং এর বিষয়বস্তু নির্বাচনের ক্ষেত্রে যেসব প্রশ্ন বিবেচনা করা হয়:</p>
<ul style="text-align: justify;">
<li style="text-align: left;">দাবির বিষয়বস্তুটি কি উল্লেখযোগ্য বা জনগুরুত্বপূর্ণ?</li>
<li style="text-align: left;">এটি কি কোনো গোষ্ঠী বা উল্লেখযোগ্যসংখ্যক মানুষকে প্রভাবিত করতে পারে?</li>
<li style="text-align: left;">জনসাধারণের জন্যে এই বিষয়ে সিদ্ধান্ত নেওয়া কী কঠিন? সংশ্লিষ্ট তথ্য কী অস্পষ্ট বা দুর্বোধ্য? এসব তথ্য কী সহজলভ্য?</li>
<li style="text-align: left;">সংবাদটি কি এরকম উস্কানিমূলক বা সংবেদনশীল, যে এর সত্যতা যাচাই করা না থাকলে এটি কোনো ব্যক্তি, প্রতিষ্ঠান বা গোষ্ঠীর জন্য ক্ষতিকর হতে পারে?</li>
</ul>
<p><span style="font-size: 14pt;"><strong>আমাদের কাজের আওতায় যা যা পড়ে না </strong></span></p>
<ul>
<li>নগন্য ভুল যেমন মুদ্রণপ্রমাদ, বানান ভুল বা বলায় সামান্য ভুল</li>
<li>স্পষ্টতই ব্যঙ্গাত্মক বা হাস্যকর বিষয়বস্তু, যেমন রসিকতা/কৌতুক, মিম বা অত্যুক্তি</li>
<li>ভবিষ্যদ্বাণী এবং মতামত যা স্বভাবতই যাচাইযোগ্য নয়</li>
<li>যেসব দাবি পর্যালোচনার প্রমাণ বা তথ্যাদি সাধারণের জন্য উন্মুক্ত নয়। তবে, সর্বসাধারণের বিষয়টি নিয়ে প্রবলআগ্রহ থাকলে আমরা আমাদের পাঠকদের জন্য সে বিষয়ে যা যা তথ্যপ্রমাণ পাওয়া গেছে তা উপস্থাপন করে থাকি।</li>
<li>ধর্ম সম্বন্ধীয় দাবি যা যাচাই করার জন্য সে বিষয়ে বিশেষায়িত জ্ঞান প্রয়োজন</li>
<li>ষড়যন্ত্রতত্ত্ব, কিংবদন্তি বা অলৌকিক ঘটনা – এসব জনপ্রিয় বা ভাইরাল হলেও সেগুলোর তথ্য বা দাবি যাচাইযোগ্য নয়</li>
<li>বাংলাদেশের রাজনীতিবিদদের রাষ্ট্রীয় নীতি বিষয়ক বা জনগুরুত্বপূর্ণ সিদ্ধান্ত বা বক্তব্য ব্যতিরেকে কোন&nbsp; রাজনৈতিক বক্তব্য যাচাইয়ের আওতায় রাখা হয় না</li>
</ul>
<p><span style="font-size: 14pt;"><strong>প্রতিবেদন লেখা ও সম্পাদনার কার্যধারা </strong></span></p>
<ul>
<li><strong>ফ্যাক্ট-চেকিং দল</strong>, অর্থাৎ <strong>ফ্যাক্ট-চেকার ও ইন্টার্নরা</strong> <strong>প্রধান গবেষকের</strong> দিকনির্দেশনায় আমাদের ফ্যাক্ট-চেকিং প্রক্রিয়াটি অনুসরণ করে, যার বিস্তারিত নিচে দেওয়া আছে। গবেষণাটি দলগতভাবে হলেও একজন ফ্যাক্ট-চেকারকে প্রতিবেদন লেখার জন্য মনোনীত করা হয়।</li>
<li>খসড়া প্রতিবেদনটি তৈরী হলে <strong>সহকারী সম্পাদক</strong> অনুলিপি সম্পাদনাগুলি সম্পাদন করেন এবং নির্ভুলতা, প্রাসঙ্গিকতা এবং ভারসাম্যের জন্য উত্সগুলি পরীক্ষা করেন। প্রয়োজনে লেখক কোনও গুরুত্বপূর্ণ তথ্য বাদ দিয়েছেন বলে মনে হলে সহকারী সম্পাদক আরেকবার স্বতন্ত্র গবেষণা গবেষণা পরিচালনা করেন।</li>
<li>ফ্যাক্ট-ফাইল এবং যেসব প্রতিবেদনে গবেষনাধর্মী নিবন্ধ বা বিশেষজ্ঞের পরামর্শের প্রয়োজন হয়, <strong>প্রধান গবেষক</strong> সেই ফ্যাক্ট চেকিং প্রক্রিয়াগুলি নিবিড়ভাবে দেখেন। অন্যদিকে তথ্য-প্রযুক্তি বিষয়ক যেকোন বিষয়বস্তু এবং ফ্যাক্ট চেকিং-এ কোন প্রযুক্তিগত প্রশ্ন থাকলে আমাদের <strong>প্রযুক্তি উপদেষ্টা</strong> সেখানে অংশগ্রহণ করেন।</li>
<li>প্রাথমিক সম্পাদনা শেষে প্রয়োজনে লেখককে রিপোর্টটি সংশোধন করতে বলা হয়। সম্পাদিত প্রতিবেদনটি প্রস্তুত হয়ে গেলে, <strong>সহকারী সম্পাদক</strong> ওয়েবসাইট এবং ফেসবুকের পৃষ্ঠায় প্রকাশের আগে <strong>প্রতিষ্ঠাতা সম্পাদকের</strong> কাছ থেকে একটি চূড়ান্ত অনুমোদন নেন।</li>
<li>সাধারণত আমাদের আমাদের ফ্যাক্ট-চেকিং পদ্ধতি স্বয়ংক্রিয়ভাবে একটি নির্দিষ্ট রেটিংয়ের দিকে নিয়ে যায়। তবে, যখন সহকারী সম্পাদক লেখকের প্রস্তাবিত রেটিংয়ের সাথে একমত হতে পারেন না, তখন <strong>প্রতিষ্ঠাতা সম্পাদক</strong><strong>, প্রধান গবেষক এবং সহকারী সম্পাদকের</strong> মধ্যে আলোচনার ভিত্তিতে <strong>চূড়ান্ত সিদ্ধান্ত</strong> নেওয়া হয়।</li>
</ul>
<p style="text-align: justify;"><span style="font-size: 14pt;"><b>তথ্যযাচাইয়ের ধাপসমূহ</b></span></p>
<p style="text-align: justify;">ফ্যাক্টওয়াচে প্রকাশ করার আগে তথ্য যাচাইয়ের জন্য আমরা নিম্নলিখিত নিয়মগুলো অনুসরণ করে থাকি:</p>
<p style="text-align: justify;">১। যে সংবাদটির সত্যতা যাচাই করা হবে, তার উৎস কি? কেন এই তথ্যের যাচাই করা দরকার? উৎস শনাক্ত করার ক্ষেত্রে আমরা তথ্যের স্ক্রিনশট এবং সংশ্লিষ্ট লিংকগুলো প্রতিবেদনে যুক্ত করে থাকি।</p>
<p style="text-align: justify;">২। প্রয়োজনীয় গবেষণা সম্পন্ন করা সাপেক্ষে আমরা ঐ সংবাদটির সত্য/মিথ্যা সংক্রান্ত সিদ্ধান্ত গ্রহণ করি। প্রতিবেদনের এই ধাপে আমরা আমাদের মূল্যায়ন যুক্ত করি। তারপর ধাপে ধাপে আমাদের দাবির সপক্ষে প্রমাণ দাখিল করি।</p>
<p style="text-align: justify;">৩। আমাদের উপাত্ত সংগ্রহের প্রাথমিক মাধ্যম হচ্ছে গণমাধ্যম ও সামাজিক মাধ্যম। কিন্তু প্রয়োজনে আমরা সংবাদটির প্রাথমিক উৎসের (যথা, কোনো ব্যক্তি, এজেন্সি, গোষ্ঠী বা সাংবাদিক) সাথে আলাপচারিতা কিংবা যোগাযোগের মাধ্যমেও এর সত্যতা যাচাই করে থাকি।</p>
<p style="text-align: justify;">৪। তথ্য যাচাইয়ের উৎস নির্বাচনে আমরা প্রতিষ্ঠিত গণমাধ্যম, সংবাদ এজেন্সি কিংবা দায়িত্বপ্রাপ্ত অথরিটিকেই প্রামাণ্য বিবেচনা করি। সেরকম প্রামাণ্য সূত্র না পাওয়া পর্যন্ত আমরা সিদ্ধান্ত গ্রহণ করি না। ইমেজ বা ভিডিও যাচাইয়ের ক্ষেত্রে আমরা প্রতিষ্ঠিত ছবিযাচাই প্লাটফর্ম তথা গুগল ইমেজ, টিন আই রিভার্স ইমেজ সার্চ ইত্যাদির সাহায্য নিই।</p>
<p style="text-align: justify;">৫। ফ্যাক্ট ফাইল বা প্রয়োজনীয় তথ্য সন্নিবেশ করে কোনো প্রতিবেদন রচনার ক্ষেত্রে আমরা একাডেমিক এবং স্বীকৃত জর্নালে প্রকাশিত গবেষণা নিবন্ধগুলো থেকে সূত্র নিয়ে থাকি।</p>
<p style="text-align: justify;">৬। প্রতিবেদন প্রকাশের ক্ষেত্রে ফ্যাক্টওয়াচ সর্বোচ্চ স্বচ্ছতা&nbsp; নিশ্চিত করে। আমরা আমাদের প্রতিটি প্রতিবেদনে পূর্ণাঙ্গ সূত্রনির্দেশনা দিয়ে রাখি। প্রতিবেদনের ধাপে ধাপে এই সূত্র সন্নিবেশ করা হয়, যাতে পাঠকের পক্ষে আমাদের তথ্যযাচাই এর প্রক্রিয়াটুকু পরিষ্কার হয়। প্রতিবেদনের শেষেও আমরা সবগুলো সূত্রকে নির্ঘণ্ট আকারে প্রদান করে থাকি। যদি এমন মনে হয় যে, সূত্রটি সাধারণের পক্ষে অপ্রবেশ্য কিংবা কোনো কারণে পরবর্তীতে খুঁজে পাওয়া নাও যেতে পারে – সেক্ষেত্রে সেই সূত্রের স্ক্রিণশট আমরা প্রতিবেদনে যুক্ত করি সূত্র প্রদানের অতিরিক্ত দায়িত্ব হিসেবে।</p>
<p style="text-align: justify;">৭। তথ্যযাচাইয়ের রেটিং এর ক্ষেত্রে প্রতিবেদক প্রাথমিক রেটিং প্রস্তাব করেন। তারপর প্রতিবেদনটি নিয়ে সম্পাদক ও গবেষকদের মধ্যে আলোচনাসাপেক্ষে রেটিংটির যাথার্থ্য নিরূপণ করা হয়। অধিকাংশ ক্ষেত্রেই যাচাই পদ্ধতি স্বয়ংক্রিয়ভাবে রেটিং নির্ধারণ করে দেয়। অল্প কিছু ক্ষেত্রে যাচাই পদ্ধতি অনুসরণ করার পরেও রেটিং নিয়ে সম্পাদনা পর্ষদে দ্বিমত থেকে যেতে পারে। সেক্ষেত্রে ফ্যাক্টচেকারদের মধ্যে ভোটের মাধ্যমে রেটিং নির্ধারণের ব্যবস্থা রাখা হয়েছে।</p>
<p style="text-align: justify;">৮। প্রতিটি প্রতিবেদনের ক্ষেত্রে আমরা তার রেটিংটি দুই জায়গায় প্রদান করি: প্রথমত, প্রধান ছবি বা ফিচারড ইমেজের ওপরে; দ্বিতীয়ত: প্রতিবেদনের শুরুতে।</p>
<p style="text-align: justify;"><span style="font-size: 14pt;"><strong>ক্যাটাগরিসমূহ</strong></span></p>
<p style="text-align: justify;">ফ্যাক্টওয়াচ মূলত তিনটি জেনেরিক ক্যাটাগরিতে তার প্রতিবেদনগুলো সন্নিবেশ করে।</p>
<p style="text-align: justify;">১. ইন্টারনেট গুজব: যেখানে সামাজিক মাধ্যম কিংবা গণমাধ্যমে ভাইরাল হয়ে যাওয়া যাবতীয় গুজব, ভূয়া ছবি, ভূয়া ভিডিও ইত্যাদি বিষয়ে ফ্যাক্টওয়াচের যাচাই প্রতিবেদন সন্নিবেশিত হয়।</p>
<p style="text-align: justify;">২. ফ্যাক্টফাইল: গুজব নয়, আবার ঠিক ভাইরালও নয়, কিন্তু গণমাধ্যমে বা সামাজিক মাধ্যমে মনগড়া তথ্যের নানারকম পরিবেশনার কারণে আমরা অনেক বিভ্রান্তির মুখোমুখি হই। এই পরিসরে এ ধরনের বিষয়গুলোকে নিয়ে গবেষণাধর্মী এবং বিশ্লেষণাত্মক নিবন্ধ সন্নিবেশিত হয়।</p>
<p style="text-align: justify;">ফ্যাক্টফাইলে তিনটি সাবক্যাটাগরি আছে: তথ্য যাচাই, বিজ্ঞাপন যাচাই এবং লেখাজোখা। পণ্যের বিজ্ঞাপন যেহেতু ভোক্তা হিসেবে আমাদের তথ্য পাওয়ার একটি গুরুত্বপূর্ণ উৎস, সেজন্য একে একটি সাব ক্যাটাগরি হিসেবে ফ্যাক্টওয়াচ বিবেচনা করে। রাজনৈতিক প্রচারণাগুলোকেও এই ক্যাটাগরির অধীনে যাচাই করা হয়।</p>
<p style="text-align: justify;">৩. ফ্যাক্টওয়াচ ভিডিও: এতে বিভিন্ন গুরুত্বপূর্ণ ফ্যাক্টফাইল ইস্যু তথা জনগুরুত্বপূর্ণ বিষয়গুলোকে সহজবোধ্য ভিডিও প্রতিবেদন আকারে পরিবেশন করা হয়।</p>
<p style="text-align: justify;">৪. করোনাভাইরাস: এটি মূলত বিশেষ একটি ক্যাটাগরি, ফ্যাক্টওয়াচের জেনেরিক ক্যাটাগরি নয়। করোনামহামারি আমলে তৈরি হতে থাকা প্রচুর গুজব, মনগড়া তথ্য এবং বিভ্রান্তিকর বিষয়গুলোকে এক সারিতে রাখার জন্য এই ক্যাটাগরিটুকু করা হয়েছে। এই ক্যাটাগরির অধীনে তিনটি সাবক্যাটাগরি আছে, যথা: করোনা তথ্য যাচাই, জরুরি পরামর্শ ও জনউদ্যোগ। প্রথমটি সরাসরি ফ্যাক্টচেকিং সম্পর্কিত হলেও। পরের ক্যাটাগরিগুলোতে সন্নিবেশিত তথ্য নানাভাবে জনসাধারণকে বিভ্রান্তির হাত থেকে রক্ষা করে এবং দিকনির্দেশনা দেয়। ফলে, ফ্যাক্টওয়াচ এসব তথ্যের সন্নিবেশ করাকে এই দুর্যোগময় সময়ে জরুরি দায়িত্ব মনে করে।</p>
<p><span style="font-size: 14pt;"><b>ফ্যাক্টওয়াচ রেটিং</b></span></p>
<p>আমরা আট ধরনের রেটিং ব্যবহার করে থাকি:</p>

</div>""";






var nonPartisanBanglaDescription="""<div class="entry-content">
							<table style="border-collapse: collapse; width: 94.3939%; height: 1365px;">
<tbody>
<tr>
<td style="width: 50.1514%;">
<p><strong>নিরপেক্ষতা নীতি</strong></p>
<p>ফ্যাক্টওয়াচ-এর কোনরকম রাজনৈতিক পক্ষপাত নেই। আমরা স্বীকার করি যে, আমাদের প্রত্যেক সদস্যের নিজস্ব রাজনৈতিক ও ব্যক্তিগত মতামত থাকতে পারে, কিন্তু তারা অবশ্যই বস্তুনিষ্ঠতা এবং নিরপেক্ষতা রক্ষায় প্রতিশ্রুতিবদ্ধ। এ কারণেই প্রতিটি ফ্যাক্ট-চেক পরিচালনা ও প্রতিবেদন তৈরি করার জন্য তাদের অবশ্যই একটি স্বচ্ছ এবং ব্যাখ্যামূলক পদ্ধতি অনুসরণ করতে হয়।</p>
<p>আমাদের কার্যপ্রণালী এমনভাবে কাঠামোবদ্ধ, যেখানে কোন প্রতিনিধির ব্যক্তিগত পক্ষপাত বা একপেশে ভাব প্রকাশের সুযোগ নেই। প্রতিটি তথ্য যাচাইয়ের ক্ষেত্রে বিশ্লেষণী পদ্ধতি অনুসরণ করা হয়। এককভাবে কোনো প্রতিবেদক একটি প্রতিবেদনের তথ্যসংগ্রহ, রচনা ও যাচাইয়ের দায়িত্ব পালন করেন না। এটি দলগত প্রক্রিয়া। এ কারণেই ফ্যাক্টওয়াচে একটি গবেষণা দল যুক্ত থাকে, যাদের কাজ প্রতিটি তথ্য যাচাই প্রক্রিয়ার&nbsp; বৈজ্ঞানিক পরিবেশন নিশ্চিত করা।</p>
<p>সম্ভাব্য স্বার্থ-দ্বন্দ্ব এড়াতে আমরা&nbsp; কোন রাজনৈতিক ও পক্ষসমর্থক সংস্থার সাথে সদস্যগণের সক্রিয় সম্পৃক্ততাকে নিরুত্সাহিত করি । আমরা এধরণের কোন উত্স থেকে আর্থিক সাহায্য বা অনুদান ও গ্রহণ করি না।</p>
<p>নিরপেক্ষতা নিশ্চিত করতে ফ্যাক্টওয়াচ প্রতিনিধিদের অবশ্যই নিম্নলিখিত শর্তাবলী মেনে চলতে হবে:</p>

<ul>
<li>&nbsp;কোন রাজনৈতিক দলের পক্ষে প্রচার চালানো থেকে বিরত থাকবে</li>
<li>এমন প্রতীক বা পোশাক পরিধান থেকে বিরত থাকবে যা কোন রাজনৈতিক মতকে ধারণ করে</li>
<li>রাজনৈতিক সাহিত্যের মুদ্রণ, ডিজিটাল বা অন্য কোন উপায়ে সেগুলো প্রকাশ বা প্রচার করবে না</li>
<li>&nbsp;ফ্যাক্টওয়াচের সরঞ্জাম ব্যবহার করে রাজনৈতিক সাহিত্য বা মতামত কোন রূপে মুদ্রণ, ও কপি করা হতে বিরত থাকবে</li>
<li>কেবল তথ্য সংগ্রহ ব্যতীত কোন রাজনৈতিক দলের পক্ষে বা বিরুদ্ধে নিজে প্রতিবাদে অংশ নেওয়া বা কোন ব্যক্তিকে প্রতিবাদ করতে বাধ্য করা যাবে না</li>
<li>দলের অন্যান্য সদস্যদের তাদের নাগরিক দায়িত্ব পালনে বাঁধা দেবে না</li>
<li>দলের অন্যান্য সদস্যদের উপরিউক্ত নিয়মগুলো মানতে নিরুৎসাহিত করবে না</li>
</ul>
</li>
</ul></td></tr></tbody></table><br><br><span><p><strong>আমরা </strong><strong>যেভাবে</strong><strong> সম্মতি নিশ্চিত করি</strong></p>
<p>নির্দলীয় নীতিমালা পালন করা হচ্ছে কি না তা নিশ্চিত করার &nbsp;জন্য আমরা সদস্য নিয়োগের পূর্বে তাদেরকে এ বিষয়ে অবহিত করি এবং সামাজিক যোগাযোগ মাধ্যমে তাদের ব্যাক্তিগত কার্যক্রম দেখে নেই। &nbsp;এছাড়া নিয়োগের পর দলের প্রত্যেক সদস্যদের এ বিষয়ে বিস্তারিত প্রশিক্ষণ দেয়া হয়। ফ্যাক্ট চেকিং এর পূর্বে শিক্ষার্থী ফ্যাক্ট-চেকার এবং শিক্ষানবিশদের ওরিয়েন্টেশনের অংশ হিসেবে এবিষয়ে প্রশিক্ষণ দেয়া হয়। প্রতিষ্ঠাতা সম্পাদক এবং প্রধান গবেষকের নেতৃত্বাধীন ত্রৈমাসিক পর্যালোচনার মাধ্যমে ফ্যাক্ট ওয়াচের সকল কর্মী &nbsp;একটি নিরপেক্ষ ফ্যাক্ট চেকিং প্রতিষ্ঠান হিসেবে আমাদের মৌলিক নীতিমালাগুলি সমুন্নত রাখা হচ্ছে কি না তার পর্যালোচনা করা হয়।</p>
<p>&nbsp;</p></span></div>""";





var nonPartisanEnglishDescription="""<div class="entry-content">
							<table style="border-collapse: collapse; width: 94.3939%; height: 1365px;">
<tbody>
<tr>

<td style="width: 49.8486%;"> 
<h5><span style="font-size: 12pt;"><b>Non-Partisanship Policy </b></span></h5>
<p><span style="font-weight: 400; font-size: 12pt;">FactWatch does not serve any partisan political agenda. We recognize that while every team member may have their own political views and personal opinions, they must uphold our commitment to objectivity and neutrality. This is why there is a clear and binding procedure they must follow in conducting and reporting every single fact-check.&nbsp;</span></p>
<p><span style="font-weight: 400; font-size: 12pt;">To avoid personal biases or preferences from influencing our reports, we adhere to one standard procedure for all our fact checks. We take an analytical approach where every fact check is a team effort. Fact finding, research, assessment, or reporting is never done single handedly by any team member. It is always a team effort. This is why we emphasize research so that we can present the fact checking process in a scientific manner.</span></p>
<p><span style="font-weight: 400; font-size: 12pt;">To avoid potential conflicts of interest, we do not encourage our team members to get attached to any political or policy positions. Neither do we accept donations from any such sources.</span></p>
<p><span style="font-weight: 400; font-size: 12pt;">FactWatch team members must adhere to the following conditions to ensure non-partisanship:&nbsp;</span></p>

<ul>
<li style="text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Campaigning for any political party&nbsp;</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Soliciting team members to cast or not cast vote(s) at the time of any elections&nbsp;</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Wearing badges, buttons, or attire which communicates any form of political views&nbsp;</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Sharing of political literature in print, digital or any other form&nbsp;</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Using FactWatch equipment for printing, copying or communicating political literature or views in any form&nbsp;</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Attending protests or forcing person(s) to protest for or against a political cause other than to collect information</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Influencing other team members in exercising their own citizenship rights&nbsp;</span></li>
<li style="font-weight: 400; text-align: left;"><span style="font-weight: 400; font-size: 12pt;">Influencing other team members not to follow these conditions</span></li>
</ul>
</li>
</ul>
<p><span style="font-size: 12pt;"><span style="font-weight: 400;"><strong>How We Ensure Compliance</strong><br>
</span>Our team members are briefed and their public social media activities are screened before onboarding&nbsp;to ensure compliance to the Non-Partisanship Policy. Student fact-checkers and interns are trained on the policy as part of their orientation.&nbsp;Quarterly Ethics and Policy reviews headed by the founding Editor and Head of Research monitor and reinforce compliance of our fundamental policies as an independent fact-checking organization.</span></p></td>
</tr>
</tbody>
</table>

</div></div><!--end responsive_icons-->			
					</div>""";


var ccBangla="""<div class="entry-content">
<table style="border-collapse: collapse; width: 94.3939%; height: 1365px;">
<tbody>
<tr>
<td style="width: 50.1514%;font-size: 20pt;"><strong>সংশোধন ও অভিযোগ নীতি </strong><p></p>
<p>ফ্যাক্টওয়াচ সর্বদাই তথ্যের নির্ভুলতা ও জবাবদিহিতায় প্রতিশ্রুতিবদ্ধ। কোন প্রতিবেদন প্রকাশের পরে যদি আমরা জানতে পারি, কোথাও কোন ভুল হয়েছে বা কোনকিছু বাদ পড়েছে, সেক্ষেত্রে যথাসম্ভব দ্রুততার সাথে আমরা প্রতিবেদনটি সংশোধন করে থাকি। ফ্যাক্টওয়াচ দল তাদের নিয়মিত সাপ্তাহিক সভায় পূর্ব-প্রকাশিত প্রতিবেদনগুলোর প্রয়োজনীয় সংশোধন বা পরিমার্জন নিয়ে পর্যালোচনা করে।</p>
<p>কোন প্রতিবেদনে যদি তথ্যের ভুল বা অসম্পূর্ণতা খুঁজে পান, তবে অনুগ্রহপূর্বক ফ্যাক্টওয়াচের সাথে সরাসরি যোগাযোগ করুন। আপনাদের মূল্যবান মতামত, অভিযোগ কিংবা প্রতিক্রিয়া জানাতে ইমেইল করুন&nbsp; <strong>‘</strong><a href="mailto:contact@fact-watch.org"><strong>contact@fact-watch.org</strong></a><strong>’</strong> এই ঠিকানায় অথবা বার্তা দিন ফ্যাক্টওয়াচের <a href="https://www.facebook.com/fwatch.bangladesh"><strong></strong></strong>ফেইসবুক পেইজে</strong></a> কিংবা ইনবক্সে। সম্ভব হলে, প্রাসঙ্গিক এবং উন্মুক্ত ডেটা বা লিংক সেখানে অন্তর্ভুক্ত করুন। নির্ভুল তথ্য প্রকাশে আপনাদের সহযোগিতা আমাদের কাম্য।</p>
<p><strong>তবে</strong> <strong>&nbsp;</strong><strong>আমাদের কাজের আওতায় কী কী&nbsp; পড়ে না তা অনুগ্রহ করে&nbsp; বিবেচনা করবেন :</strong></p>
<ul>
<li>নগন্য ভুল যেমন মুদ্রণপ্রমাদ, বানান ভুল বা বলায় সামান্য ভুল।</li>
<li>স্পষ্টতই ব্যঙ্গাত্মক বা হাস্যকর বিষয়বস্তু, যেমন রসিকতা/কৌতুক, মিম বা অত্যুক্তি।</li>
<li>ভবিষ্যদ্বাণী এবং মতামত যা স্বভাবতই যাচাইযোগ্য না।</li>
<li>যেসব দাবি পর্যালোচনার প্রমাণ বা তথ্যাদি সাধারণের জন্য উন্মুক্ত নয়। তবে, সর্বসাধারণের বিষয়টি নিয়ে প্রবলআগ্রহ থাকলে আমরা আমাদের পাঠকদের জন্য সে বিষয়ে যা যা তথ্যপ্রমাণ পাওয়া গেছে তা উপস্থাপন করে থাকি, তবে এ ধরণের প্রতিবেদনগুলোতে সাধারণত “যাচাই করা যায়নি” রেটিংটি দেয়া হয়।</li>
<li>ধর্ম সম্পর্কিত দাবি যা যাচাই করার জন্য সে বিষয়ে বিশেষায়িত জ্ঞান প্রয়োজন।</li>
<li>ষড়যন্ত্রতত্ত্ব, কিংবদন্তি বা অলৌকিক ঘটনা, এসব জনপ্রিয় বা ভাইরাল হলেও সেগুলোর তথ্য বা দাবি যাচাইযোগ্য নয়।</li>
<li>বাংলাদেশের রাজনীতিবিদদের কোন দলের প্রতিনিধিত্বমূলক বক্তব্য যাচাইয়ের আওতায় রাখা হয় না, যেমন নির্বাচনী প্রচারণা বা দলীয় সভায় রাখা বক্তব্য।</li>
<li>তবে বাংলাদেশের কোন রাজনীতিবিদ যখন নির্বাচনী এলাকার প্রতিনিধি বা কোন মন্ত্রনালয়ের দায়িত্বপ্রাপ্ত মন্ত্রী হিসেবে কোন বক্তব্য রাখেন, তা আমাদের কাজের আওতায় পড়ে।</li>
<li>বাংলাদেশের রাজনীতিবিদরা যখন যেকোন নাগরিকের মত অপতথ্যের শিকার হন, যেমন তিনি বলেন নি এমন কোন কথা তার বরাত দিয়ে প্রচারিত হলে বা কোন এডিট করা ছবি বা পুরান/ভিন্ন পরিস্থিতির ছবি অন্যভাবে চালিয়ে দেওয়া হলে তা-ও আমাদের কাজের আওতায় পড়ে।</li>
</ul>
<p>&nbsp;</p>
<p><strong>প্রক্রিয়া</strong></p>
<p>আমরা পাঠকদের কাছ থেকে ইমেইল এবং / অথবা সামাজিক মাধ্যমে পাওয়া প্রতিটি প্রতিক্রিয়ার জবাব দিতে আগ্রহী, তবে নিতান্তই অমার্জিত কিংবা অপ্রয়োজনীয় মতামত এড়িয়ে চলি। ইমেইল অথবা ফেইসবুক পেইজ থেকে আসা পাঠকদের যেকোন ধরনের মন্তব্য প্রাথমিকভাবে আমাদের সামাজিক মাধ্যম পর্যবেক্ষক দল সনাক্ত করেন এবং পরবর্তীতে ঊর্ধ্বতন সদস্য পর্যালোচনা করেন।</p>
<p>পাঠকের প্রতিক্রিয়া বা মন্তব্যের প্রেক্ষিতে যদি কোনো প্রতিবেদন পরিমার্জনের সিন্ধান্ত নিতে হয়, তবে সেটি দ্রুততম সময়ের মধ্যে মূল পোস্টে করে দেয়া হয়, এবং ফুটনোটে পরিবর্তনের অংশটি সুস্পষ্টভাবে আলোকপাত করা হয়।</p>
<p>আমরা তথ্য যাচাইয়ের ধারণাটি জনসাধারণের মাঝে আরও ছড়িয়ে দিতে তাদের প্রতিটি প্রতিক্রিয়ারই জবাব দিতে আগ্রহী। কোন তথ্যটি যাচাইযোগ্য এবং কোনটি নয় সে বিষয়ে আমরা পাঠকদের অবহিত করি এবং কেন নির্দিষ্ট কিছু অভিযোগ, সংশোধন বা তথ্য যাচাইয়ের অনুরোধ আমরা প্রত্যাখ্যাত করি তা প্রাসঙ্গিক নীতিমালা উল্লেখ করে জানিয়ে দেই।</p>
<p><strong>লেবেলিং </strong></p>
<p>ত্রুটি সংশোধনের ক্ষেত্রে, প্রতিবেদনে একটি নোট যুক্ত হবে এবং পরিবর্তনের ব্যাখ্যাসহ সে জায়গায় <b>“সংশোধন”</b> লেবেল যুক্ত করা হয়।</p>
<b>তথ্য আপডেটের ক্ষেত্রেও প্রতিবেদনে একটি নোট যুক্ত হবে এবং পরিবর্তনের ব্যাখ্যাসহ সে জায়গায় <b>“আপডেট”</b> লেবেল যুক্ত করা হয়।</p></td></tr></tbody></table></div>""";




var ccEnglish="""
<div class="entry-content">
<table style="border-collapse: collapse; width: 94.3939%; height: 1365px;">
<tbody>
<tr>
<td style="width: 49.8486%;">

<h5><span style="font-size: 20pt;"><b>Corrections and Complaints policy</b></span></h5>
<p>FactWatch is committed to accuracy and accountability. After a report is published, if we discover that we have made a mistake or omission, we will revise our report with full disclosure of the update.&nbsp;The FactWatch team will review previously published material in our weekly meetings for any necessary corrections or updates.</p>
<p>Furthermore, if YOU find any such issues with our reports, please let us know. We are happy to receive any input that helps us improve our work.</p>
<p>Please send feedback, corrections or complaints to&nbsp;<strong>‘</strong><a href="mailto:contact@fact-watch.org"><strong>contact@fact-watch.org</strong></a><strong>’</strong>&nbsp;or&nbsp;via&nbsp;<a href="https://www.facebook.com/fwatch.bangladesh"><strong>our facebook page</strong></a>&nbsp;as a message. Whenever possible, include any relevant resources, such as links to reference material or data that is publicly accessible.</p>
<p>However, please do keep in mind that we do not cover:</p>
<ul>
<li>Inconsequential glitches, such as a misspelling or slip of the tongue.</li>
<li>Content that is clearly sarcastic or humorous, such as jokes, memes or hyperbole.</li>
<li>Predictions and opinions that are not fact-checkable by their very nature.</li>
<li>Claims that involve evidence that cannot be accessed publicly. However, if there is significant public interest in the topic we may run a full fact-check process to present our readers with available evidence but rate the fact as “Could not be verified”.</li>
<li>Religious claims that require specialized/theological expertise to verify.</li>
<li>Conspiracy theories, rumors, urban legends or paranormal incidents that may be popular but cannot be subjected to the fact-checking process.</li>
<li>We do not cover statements by politicians when representing their political party, e.g. claims they make as part of any election campaign or political speech.</li>
<li>However, if a politician is speaking as a representative of a constituency or a gov’t office (e.g. as a minister) that may affect the public in a practical manner, we do fact-check such statements.</li>
<li>We also cover fact-checks where politicians are victims of misinformation like any other citizen, e.g. if they are misquoted or misrepresented by edited or out of context images.</li>
</ul>
<p><strong>Process</strong></p>
<p>We intend to respond to <strong>every piece of feedback</strong> received from readers via email and/or Facebook messages, other than blatantly frivolous ones. They will be reviewed initially by our interns and then by a senior member of staff.</p>
<p>As soon as we have considered your feedback or comment, we will inform you of our response and any subsequent action. Any such change will be clearly highlighted in the article.</p>
<p>We do intend take the time to respond to every single feedback to build public understanding of fact checking. We will inform readers about what is or is not fact-checkable and why we may not move forward with complains, corrections, or fact-check requests, citing relevant policies.</p>
<p><strong>Labeling&nbsp;</strong></p>
<p>In the case of a factual error, a note will be added to the report and labelled&nbsp;<strong>“CORRECTION”</strong>, with an explanation of the changes made.</p>
<p>In the case of clarifications or updates, a note will be added and labelled&nbsp;<strong>“UPDATE”</strong>, with an explanation of the changes made.</p></td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

</div>""";