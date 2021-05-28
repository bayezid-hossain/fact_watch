import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'News.dart';
import 'package:fact_watch/individual_news.dart';
import 'CategoriesTile.dart';
import 'package:share/share.dart';

class NewsTileSmall extends StatelessWidget {
  final News news;
  NewsTileSmall({required this.news});

  @override
  Widget build(BuildContext context) {
    print(news.categories);
    return InkWell(
      splashColor: Colors.blueAccent,
      customBorder: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueAccent),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => IndividualNews(news)));
      },
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              backgroundColor: Colors.white,
              focusColor: Colors.white,
            ),
            child: Container(
              child: Card(
                margin: EdgeInsets.only(bottom: 5),
                borderOnForeground: true,
                elevation: 0,

                // borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 3,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Text(
                              news.title,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        if (news.thumbnail != null)
                          Flexible(
                            flex: 0,
                            child: Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                child: CachedNetworkImage(
                                  height: 80,
                                  width: 80,
                                  imageUrl: news.thumbnail,
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => Center(
                                    child: SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: new CircularProgressIndicator(),
                                    ),
                                  ),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    CategoriesTile(news: news),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Published on ${news.date}"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  final RenderBox box = context.findRenderObject() as RenderBox;
                                  Share.share(
                                      "${news.title}\nLink: https://www.fact-watch.org/web/?p=${news.id}",
                                      subject: news.title,
                                      sharePositionOrigin:
                                          box.localToGlobal(Offset.zero) &
                                              box.size);
                                },
                                child: Icon(
                                  Icons.share,
                                  size: 20,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              InkWell(
                                onTap: () {
                                  news.fav = true;
                                },
                                child: Icon(
                                  Icons.bookmark_border,
                                  size: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.blueAccent,
            height: 1,
          ),
        ],
      ),
    );
  }
}
//
//
// void checkBoxCallBack(bool currentCheckboxState) {
//   setState(() {
//     isChecked = currentCheckboxState;
//   });
// }
