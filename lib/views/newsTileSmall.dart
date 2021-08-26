import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/News.dart';
import 'package:fact_watch/screens/individual_news.dart';
import 'CategoriesTile.dart';
import 'package:share/share.dart';
import 'favoriteButton.dart';
import '../functions/functionalities.dart';
class NewsTileSmall extends StatefulWidget {
  final News? news;
  final bool removeTile;
  final Function function;
  NewsTileSmall({required this.news,required this.removeTile,required this.function});

  @override
  _NewsTileSmallState createState() => _NewsTileSmallState();
}

class _NewsTileSmallState extends State<NewsTileSmall> {
  @override
  Widget build(BuildContext context) {
    widget.news!.title=widget.news!.title.replaceAll("&#8211;","").replaceAll("&#8220;", "").replaceAll("&#8221;", "");
    return InkWell(
      splashColor: Colors.blueAccent,
      customBorder: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blueAccent),
      ),
      onTap: () async {
        (widget.removeTile==true)?Functionalities.previousRoute="Favorites":Functionalities.previousRoute="HomePage";
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
                              widget.news!.title,
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.bold, fontFamily: "BalooDa2",
                              ),
                            ),
                          ),
                        ),
                        if (widget.news!.mediaLinkLarge != null)
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
                                  imageUrl: widget.news!.mediaLinkLarge,
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
                    CategoriesTile(news: widget.news),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Published on ${widget.news!.date}",style: TextStyle(
                                fontFamily: "BalooDa2",
                              ),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  final RenderBox box = context.findRenderObject() as RenderBox;
                                  Share.share(
                                      "${widget.news!.title}\nLink: https://www.fact-watch.org/web/?p=${widget.news!.id}",
                                      subject: widget.news!.title,
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

                              FavoriteButton(news: widget.news,removeTile: widget.removeTile,function: widget.function,)
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
