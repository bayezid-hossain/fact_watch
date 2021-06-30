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
            style: TextStyle(fontSize: subMenu ? 14 : 16),
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
              MaterialPageRoute(builder: (context) => CategorizedNews(261)));
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
            MaterialPageRoute(builder: (context) => CategorizedNews(283)));}),
             getNormalRow("বিজ্ঞাপন যাচাই", () {Navigator.push(context,
                 MaterialPageRoute(builder: (context) => CategorizedNews(277)));}),
        getNormalRow("লেখাজোখা",(){Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategorizedNews(259)));}),
        getNormalRow("ফ্যাক্টওয়াচ ভিডিও", () {Navigator.push(context,
            MaterialPageRoute(builder: (context) => CategorizedNews(278)));}),
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
                MaterialPageRoute(builder: (context) => CategorizedNews(271)));}, true),
            getNormalRow("জন উদ্যোগ", () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategorizedNews(255)));}, true),
            getNormalRow("জরুরি পরামর্শ", () {Navigator.push(context,
                MaterialPageRoute(builder: (context) => CategorizedNews(265)));}, true),
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
void goto_categorizedNews(int id){

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

