import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Icon getIcon(IconData icon) {
  return Icon(icon, size: 25, color: Colors.black);
}

InkWell getNormalRow(String text, [Function? function, bool subMenu = false]) {
  return InkWell(
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
        getNormalRow("হোম", () {}),
        getNormalRow("ইন্টারনেট গুজব", () {}),
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
        getNormalRow("ফ্যাক্ট ফাইল"),
        getNormalRow("লেখাজোখা"),
        getNormalRow("ফ্যাক্টওয়াচ ভিডিও", () {}),
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
            getNormalRow("করোনা তথ্য যাচাই", () {}, true),
            getNormalRow("জন উদ্যোগ", () {}, true),
            getNormalRow("জরুরি পরামর্শ", () {}, true),
          ],
        ),
        Divider(
          height: 20,
          color: Colors.blue,
        ),

        getNormalRow("আমাদের সম্পর্কে"),
        getNormalRow("ফ্যাক্টওয়াচ টিম"),
        getNormalRow("কাজের পদ্ধতি"),
        getNormalRow("নিরপেক্ষতা নীতি"),
        getNormalRow("সংশোধন ও অভিযোগ নীতি"),
        getNormalRow("অর্থকড়ি আসে কিভাবে"),
      ],
    ),
  );
}
