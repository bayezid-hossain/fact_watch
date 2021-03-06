import 'package:flutter/material.dart';
import 'small_card.dart';
import '../screens/categorizedNewsPage.dart';
import '../functions/functionalities.dart';
import '../models/News.dart';
import 'dart:convert';

class CategoriesTile extends StatelessWidget {
  final News? news;
  CategoriesTile({required this.news});
  @override
  Widget build(BuildContext context) {
    List<dynamic> categories = jsonDecode(news!.categories);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        height: 25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    int ind = categories[index];
                    if (ind != 302 && ind != 1 && ind != 317 && (ind<40 || ind>48)) {
                      return InkWell(
                        onTap: (){
    Navigator.push(context,
    MaterialPageRoute(builder: (context) => CategorizedNews(categories[index])));
    },
                        child: SmallCard(
                            Functionalities.categories[ind].toString()),
                      );
                    } else
                      return Text("");
                  }),
            ),
          ],
        ),
      ),
    );
    //else return Container();
  }
}
