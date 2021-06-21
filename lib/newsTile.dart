import 'package:fact_watch/individual_news.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'News.dart';
import 'package:fact_watch/CategoriesTile.dart';
import 'package:share/share.dart';
import 'favoriteButton.dart';
class NewsTile extends StatefulWidget {
  final News? news;
  final bool removeTile;
  final Function function;
  NewsTile({required this.news,required this.removeTile,required this.function});

  @override
  _NewsTileState createState() => _NewsTileState();
}

class _NewsTileState extends State<NewsTile> {
  @override
  Widget build(BuildContext context) {
    print(widget.news!.categories);
    widget.news!.excerpt=widget.news!.excerpt.replaceAll("Published on: ","").replaceAll("&#8211;""","");

    widget.news!.title=widget.news!.title.replaceAll("&#8211;","");
    return InkWell(
      splashColor: Colors.blueAccent,
      onTap: () async {
        final value= await Navigator.push(context,
            MaterialPageRoute(builder: (context) => IndividualNews(widget.news)));
        print(value);
        setState(() {

        });
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
                  if (widget.news!.mediaLinkLarge != null)
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                          imageUrl: widget.news!.mediaLinkLarge,
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
                  CategoriesTile(news: widget.news),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Text(
                      widget.news!.title,
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
                      widget.news!.excerpt,
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
                              "Published on: ${widget.news!.date}",
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
                                    "${widget.news!.title}\nLink: https://www.fact-watch.org/web/?p=${widget.news!.id}",
                                    subject: widget.news!.title,
                                    sharePositionOrigin:
                                        box.localToGlobal(Offset.zero) &
                                            box.size);
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FavoriteButton(tableIndex: 1,news: widget.news,removeTile: widget.removeTile,function: widget.function,)

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
