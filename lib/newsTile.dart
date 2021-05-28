import 'package:fact_watch/individual_news.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'News.dart';
import 'package:fact_watch/CategoriesTile.dart';
import 'package:share/share.dart';

class NewsTile extends StatelessWidget {
  final News news;
  NewsTile({required this.news});

  @override
  Widget build(BuildContext context) {
    print(news.categories);
    return InkWell(
      splashColor: Colors.blueAccent,
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => IndividualNews(news)));
      },
      child: Column(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
            ),
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5),
              elevation: 0,
              // shape: new RoundedRectangleBorder(
              //     side: new BorderSide(color: Colors.transparent),
              //     borderRadius: BorderRadius.circular(20.0)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (news.mediaLinkLarge != null)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                          imageUrl: news.mediaLinkLarge,
                          fit: BoxFit.fill,
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
                  CategoriesTile(news: news),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      news.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    child: Text(
                      news.excerpt,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Published on: ${news.date}",
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              child: Icon(
                                Icons.share,
                                size: 20,
                              ),
                              onTap: () {
                                final RenderBox box = context.findRenderObject() as RenderBox;
                                Share.share(
                                    "${news.title}\nLink: https://www.fact-watch.org/web/?p=${news.id}",
                                    subject: news.title,
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.bookmark_border,
                              size: 20,
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
