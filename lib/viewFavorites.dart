import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fact_watch/functionalities.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'CategoriesTile.dart';
import 'News.dart';
import 'favoriteButton.dart';
import 'individual_news.dart';
class ViewFavorites extends StatefulWidget {


  @override
  _ViewFavoritesState createState() => _ViewFavoritesState();
}

class _ViewFavoritesState extends State<ViewFavorites> with RouteAware{

  @override
  Widget build(BuildContext context) {

    List<News?>? news = Functionalities.getFavorites()!.reversed.toList();


    if(news.length>0)return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(

            child: ListView.builder(
                shrinkWrap: true,
                itemCount: news.length + 1,
                itemBuilder: (context, index) {
                  if (index == news.length) {
                    return Column(

                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [Row(
                          // mainAxisSize: MainAxisSize.max,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Divider(),
                            Divider(),
                            SizedBox(height: 20,),
                            Expanded(
                              child: _buildCard(),
                            ),
                            Expanded(
                              child: _buildImages(),
                            )
                          ],
                        ),
                        ]);
                  } else
                    try {
                       return ((index % 5) == 0) ?  InkWell(
                      splashColor: Colors.blueAccent,
                      onTap: () async {
                        final value= await Navigator.push(context,
                            MaterialPageRoute(builder: (context) => IndividualNews(news[index])));
                       // print("Favorite Changed: "+value);
                        if(value=="true")setState(() {

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
                                  if (news[index]!.mediaLinkLarge != null)
                                    ClipRRect(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      child: AspectRatio(
                                        aspectRatio: 16 / 9,
                                        child: CachedNetworkImage(
                                          imageUrl: news[index]!.mediaLinkLarge,
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
                                  CategoriesTile(news: news[index]),
                                  Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                                    child: Text(
                                      news[index]!.title,
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
                                      news[index]!.excerpt,
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
                                              "Published on: ${news[index]!.date}",
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
                                                    "${news[index]!.title}\nLink: https://www.fact-watch.org/web/?p=${news[index]!.id}",
                                                    subject: news[index]!.title,
                                                    sharePositionOrigin:
                                                    box.localToGlobal(Offset.zero) &
                                                    box.size);
                                              },
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            FavoriteButton(tableIndex: 1,news: news[index],removeTile: true,function:  ()  {
                                              if(Functionalities.favoriteNews.favoriteNews.contains(news[index]!.id))showDialog(
                                                context: context,
                                                builder: (BuildContext context) {
                                                  return AlertDialog(
                                                    title: Text("Are you sure you want to remove this news from Bookmark?"),

                                                    actions: <Widget>[
                                                      TextButton(
                                                        child: Text("Yes"),
                                                        onPressed: () {
                                                          Navigator.pop(context, "ok");
                                                        },
                                                      ),TextButton(
                                                        child: Text("No"),
                                                        onPressed: () {
                                                          Navigator.pop(context, "no");
                                                        },
                                                      )
                                                    ],
                                                  );
                                                },
                                              ).then((val) { if(val=='ok'){Functionalities.favoriteNews.remove(news[index]!.id);

                                              print(news);

                                              };
                                              setState(() {

                                                news.removeAt(index);
                                                Functionalities.setFavorites();
                                                Functionalities.loadFavorites();

                                              });
                                              });
                                              else{ Functionalities.favoriteNews.add(news[index]!.id);

                                              setState(() {

                                                news.removeAt(index);
                                                Functionalities.setFavorites();
                                                Functionalities.loadFavorites();
                                              });
                                              }
                                            },)

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
                    ) : InkWell(
                         splashColor: Colors.blueAccent,
                         customBorder: RoundedRectangleBorder(
                           side: BorderSide(color: Colors.blueAccent),
                         ),
                         onTap: () async {
                           //(widget.removeTile==true)?Functionalities.previousRoute="Favorites":Functionalities.previousRoute="HomePage";
                           final value= await Navigator.push(context,
                               MaterialPageRoute(builder: (context) => IndividualNews(news[index])));
                          // print("Favorite Changed:"+value);
                           if(value==true)setState(() {

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
                                                 news[index]!.title,
                                                 style: TextStyle(
                                                   fontSize: 17,
                                                   color: Colors.black,
                                                   fontWeight: FontWeight.bold,
                                                 ),
                                               ),
                                             ),
                                           ),
                                           if (news[index]!.thumbnail != null)
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
                                                     imageUrl: news[index]!.thumbnail,
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
                                       CategoriesTile(news: news[index]),
                                       Padding(
                                         padding:
                                         EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                                         child: Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.start,
                                               children: [
                                                 Text("Published on ${news[index]!.date}"),
                                               ],
                                             ),
                                             Row(
                                               mainAxisAlignment: MainAxisAlignment.end,
                                               children: [
                                                 InkWell(
                                                   onTap: () {
                                                     final RenderBox box = context.findRenderObject() as RenderBox;
                                                     Share.share(
                                                         "${news[index]!.title}\nLink: https://www.fact-watch.org/web/?p=${news[index]!.id}",
                                                         subject: news[index]!.title,
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

                                                 FavoriteButton(tableIndex: 1,news: news[index],removeTile: true,function: ()  {
                                                   if(Functionalities.favoriteNews.favoriteNews.contains(news[index]!.id))showDialog(
                                                     context: context,
                                                     builder: (BuildContext context) {
                                                       return AlertDialog(
                                                         title: Text("Are you sure you want to remove this news from Bookmark?"),

                                                         actions: <Widget>[
                                                           TextButton(
                                                             child: Text("Yes"),
                                                             onPressed: () {
                                                               Navigator.pop(context, "ok");
                                                             },
                                                           ),TextButton(
                                                             child: Text("No"),
                                                             onPressed: () {
                                                               Navigator.pop(context, "no");
                                                             },
                                                           )
                                                         ],
                                                       );
                                                     },
                                                   ).then((val) { if(val=='ok'){Functionalities.favoriteNews.remove(news[index]!.id);

                                                   print(news);

                                                   };
                                                   setState(() {

                                                     news.removeAt(index);
                                                     Functionalities.setFavorites();
                                                     Functionalities.loadFavorites();

                                                   });
                                                   });
                                                   else{ Functionalities.favoriteNews.add(news[index]!.id);

                                                   setState(() {

                                                     news.removeAt(index);
                                                     Functionalities.setFavorites();
                                                     Functionalities.loadFavorites();
                                                   });
                                                   }
                                                 },)
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
                    } catch (e) {
                      print(e);
                      return SizedBox();
                    }
                }),
          ),
        ],
      ),
    );
    else return SafeArea(child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
      Container(

      height: MediaQuery.of(context).size.height / 2.5,  // Also Including Tab-bar height.
//                        child: Chewie(
//                          controller: _chewieController,
//                        ),
    child:Center(child: Text("Nothing to show",style: TextStyle(
      fontSize: 25,
      color: Colors.grey
    ),)),
        ),
      Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              Divider(),
                              SizedBox(height: 20,),
                              Expanded(
                                child: _buildCard(),
                              ),
                              Expanded(
                                child: _buildImages(),
                              )
                            ],
                          ),
      ],
    ));
  }
}



Widget _buildCard() => Column(
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
Widget _buildImages() => Column(
  mainAxisAlignment: MainAxisAlignment.end,
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
Widget _buildStack() => Stack(
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

