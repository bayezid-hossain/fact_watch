
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fact_watch/views/newsTileSmall.dart';
import 'package:flutter/material.dart';
import 'package:fact_watch/models/News.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:fact_watch/functions/constants.dart';
import 'package:share/share.dart';
import '../functions/functionalities.dart';
import 'add_comments_screen.dart';
import '../models/Comment.dart';
import '../networking/networking.dart';
import '../views/favoriteButton.dart';
class IndividualNews extends StatefulWidget {
  final News? news;

  IndividualNews(this.news);

  @override
  _IndividualNewsState createState() => _IndividualNewsState();
}

class _IndividualNewsState extends State<IndividualNews> {
  List<Comment> comments = [];

  @override
  Widget build(BuildContext context) {
    int index = Functionalities.allNews
        .indexOf(Functionalities.newsMap[widget.news!.id] as News);
    bool initFav =
        Functionalities.favoriteNews.favoriteNews.contains(widget.news!.id);


    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(
            context,
            (initFav ==
                    Functionalities.favoriteNews.favoriteNews
                        .contains(widget.news!.id))
                ? false
                : true);
        return false;
      },
      child: Scaffold(
resizeToAvoidBottomInset: true,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.black, //change your color here
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Text(
                  //   "Published on: ${widget.news!.date}",
                  //   style: TextStyle(
                  //     fontSize: 12,
                  //   ),
                  // ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Icon(
                      Icons.share,
                      size: 22,
                    ),
                    onTap: () {
                      final RenderBox box =
                          context.findRenderObject() as RenderBox;
                      Share.share(
                          "${widget.news!.title}\nLink: https://www.fact-watch.org/web/?p=${widget.news!.id}",
                          subject: widget.news!.title,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  FavoriteButton(
                    news: widget.news,
                    removeTile: false,
                    function: () {},
                  ),
                ],
              )
            ],
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
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
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Text(
                            widget.news!.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              //fontStyle: FontStyle.italic,
                              fontFamily: 'BalooDa2',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          ),
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
                        Padding(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 15),
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
                                      fontFamily: 'Kalpurush'
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: new Html(
                            data: widget.news!.description,
                            onLinkTap: (url, _, __, ___) {
                              Functionalities.launchURL(url!);
                            },

                            style: {
                              // tables will have the below background color
                              "table": Style(
                                backgroundColor: Colors.white,
                                //width: 1000,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.symmetric(vertical: 5),
                                margin: EdgeInsets.symmetric(vertical:5),
                                wordSpacing: 0,
                                letterSpacing: 0.1,
                                //width: double.maxFinite,
                                alignment: Alignment.topRight,
                              ),
                              // some other granular customizations are also possible
                              "tr": Style(
                                alignment: Alignment.center,
                                //width: double.infinity,
                              ),
                              "td": Style(
                                padding: EdgeInsets.symmetric(
                                    vertical: 0, horizontal: 10),
                                alignment: Alignment.center,
                                border:Border.all(width: 0.1,color: Colors.black),
                                //width: double.maxFinite,
                              ),
                              "p": Style(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 20),
                                fontFamily: "Kalpurush",
                              ),
                              "img": Style(
                                padding: EdgeInsets.symmetric(vertical: 10),
                              ),
                              "a": Style(
                                color: Colors.black,
                              ),
                              "div": Style(
                                alignment: Alignment.center,
                                textAlign: TextAlign.center,
                              ),'p':Style(
                                fontFamily: "Kalpurush",
                                padding: EdgeInsets.only(bottom: 5),
                                wordSpacing: 2,
                                lineHeight: LineHeight.number(1.3)
                              ),'li':Style(
                                fontFamily: "Kalpurush",
                              ),

                              'h1':Style(
                                  fontFamily: "BalooDa2"
                              ),
                              'h2':Style(
                                  fontFamily: "BalooDa2"
                              ),
                              'h3':Style(
                                  fontFamily: "BalooDa2"
                              ),
                              'h4':Style(
                                  fontFamily: "BalooDa2"
                              ),
                              'h5':Style(
                                fontFamily: "BalooDa2",
                              ),
                              'a':Style(
                                  fontFamily: "Kalpurush"
                              ),
                              'iframe':Style(
                                width: 300,
                                height: 300,
                              )
                            },
                            //blacklistedElements: ['width'],
//                             customRender: {
//                               "img": (RenderContext context, Widget child) {
//                                 String originalPic = context.tree.attributes['src'].toString();
//                                 print(originalPic);
//                                 print(context.tree.attributes['height'].toString());
//                                 print(context.tree.attributes['width'].toString());
//                                 try {
//
//                                     if (!context.tree.attributes['src'].toString().contains('Stamping') &&
//                                         !context.tree.attributes['src'].toString().contains('Logo')) {
//                                       if ((double.parse(context.tree.attributes['height'].toString()) < 600 ||
//                                           double.parse(context.tree.attributes['width'].toString()) < 400)&&context.tree.attributes['src']!.contains("x")) {
//                                       String src = context.tree.attributes['src'].toString();
//                                       String imageName = src.substring(
//                                           src.lastIndexOf('/'), src.length);
//                                       imageName = imageName.substring(
//                                           0, imageName.lastIndexOf('-'));
//                                       String extension = src.substring(
//                                           src.lastIndexOf('.'), src.length);
//                                       originalPic =
//                                           src.substring(0, src.lastIndexOf('/')) +
//                                               imageName +
//                                               extension;
//                                       //print(attributes['src']);
//                                     }
//                                     print(originalPic);
//                                   }
//                                   //print(originalPic);
//                                     if(context.tree.attributes['src'].toString().contains('Stamping')||context.tree.attributes['src'].toString().contains("Logo")){context.tree.attributes['height']="100";context.tree.attributes['width']="100";}
//
//                                     return InteractiveViewsImage(
//                                       context.tree.attributes, originalPic);
//                                 } catch (e) {
//                                   print(e);
//                                   if(context.tree.attributes['src'].toString().contains('Stamping')||context.tree.attributes['src'].toString().contains("Logo")){context.tree.attributes['height']="100";context.tree.attributes['width']="100";}
// // print(attributes['src']);
//                                   // print(originalPic);
//                                   return InteractiveViewsImage(
//                                       context.tree.attributes, context.tree.attributes['src'].toString());
//                                 }
//                               },
//                               "table": (RenderContext context, Widget child,) {
//                                 //print("$totalTables,$tableIndex");
//                                 if(tableIndex==1 || tableIndex==totalTables){
//                                   tableIndex++;
//                                   return (context.tree as TableLayoutElement).toWidget(context);
//                                 }
//                                 tableIndex++;
//                                 return SingleChildScrollView(
//                                   scrollDirection: Axis.horizontal,
//                                   child: Container(child:(context.tree as TableLayoutElement).toWidget(context),
//                                   padding: EdgeInsets.all(5),
//                                   decoration: BoxDecoration(
//                                     color: Colors.white,
//                                   ),),
//                                   clipBehavior: Clip.antiAliasWithSaveLayer,
//                                 );
//                               }
//                             },
                            customRender: {
                                 "table": (RenderContext context, Widget child,) {
                                //print("$totalTables,$tableIndex");

                                return SizedBox(
                                  width: double.infinity,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Container(child:(context.tree as TableLayoutElement).toWidget(context),
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                    ),),
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                  ),
                                );
                              },
                              "img": (RenderContext context, Widget child) {
                                print(context.tree.attributes['src']);
                                return InteractiveViewsImage(
                                    context.tree.attributes,
                                    context.tree.attributes['src'].toString());
                              },
                              "iframe":(RenderContext context,Widget child){
                                   print(context.tree.attributes['src']);
                                   return Container(
                                     height: 300,width:300,
                                     child: child
                                   );
                              }
                            },
                          ),
                        ),
                        TextButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                                isScrollControlled: true,
                                isDismissible: true,
                                elevation: 10,
                                context: context,
                                builder: (context) =>AddCommentsScreen(widget.news!.id) );
                          },
                          child: Text(
                            "মতামত জানান",
                            style: TextStyle(fontSize: 22, fontFamily: "Kalpurush",),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              "আরও দেখুন ..",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold, fontFamily: "Kalpurush",),
                            )),
                        Divider(
                          height: 10,
                        ),
                        (index <= 0)
                            ? SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    NewsTileSmall(
                                        news:
                                            Functionalities.allNews[index + 1],
                                        removeTile: false,
                                        function: () {}),
                                    NewsTileSmall(
                                        news:
                                            Functionalities.allNews[index + 2],
                                        removeTile: false,
                                        function: () {}),
                                  ],
                                ),
                              )
                            : (index != Functionalities.allNews.length - 1)
                                ? SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        NewsTileSmall(
                                            news: Functionalities
                                                .allNews[index - 1],
                                            removeTile: false,
                                            function: () {}),
                                        NewsTileSmall(
                                            news: Functionalities
                                                .allNews[index + 1],
                                            removeTile: false,
                                            function: () {}),
                                      ],
                                    ),
                                  )
                                : SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        NewsTileSmall(
                                            news: Functionalities
                                                .allNews[index - 1],
                                            removeTile: false,
                                            function: () {}),
                                        NewsTileSmall(
                                            news: Functionalities
                                                .allNews[index - 2],
                                            removeTile: false,
                                            function: () {}),

                                      ],
                                    ),
                                  ),
                        Padding(padding:EdgeInsets.symmetric(vertical: 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Divider(),
                              Divider(),
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: buildCard(),
                              ),
                              Expanded(
                                child: buildImages(),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InteractiveViewsImage extends StatefulWidget {
  final Map<String, String> attributes;
  final String src;
  InteractiveViewsImage(this.attributes, this.src);

  @override
  _InteractiveViewsImageState createState() => _InteractiveViewsImageState();
}

class _InteractiveViewsImageState extends State<InteractiveViewsImage> {
  @override
  Widget build(BuildContext context) {
    bool panEnabled = false;
    print(widget.src);
    print(widget.attributes['src']);
    print(widget.attributes['style']);
    print(widget.attributes['width'].toString());
    print(widget.attributes['height'].toString());


    try {
      if (widget.src.contains("Logo"))
        return InteractiveViewer(
          child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.src,
              height: 80,
              width: 120,
            ),
          ),
        );
      else if(widget.src.contains("/A.png")||widget.src.contains("/B.png")||widget.src.contains("/C.png")||widget.src.contains("/D.png")||widget.src.contains("/E.png")||widget.src.contains("/F.png")||widget.src.contains("/G.png")||widget.src.contains("/H.png")){
        return InteractiveViewer(
          child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.src,
              height: 70,
              width: 70,
            ),
          ),
        );
      }
      return InteractiveViewer(
        minScale: 1,
        onInteractionUpdate: (ScaleUpdateDetails scal) {
          var myScale = scal.scale;
          if (myScale > 1 && panEnabled == false) {
            setState(() {
              panEnabled = true;
            });
          } else if (myScale <= 1 && panEnabled == true) {
            setState(() {
              panEnabled = false;
            });
          }
        },
        panEnabled: panEnabled,
        maxScale: 2.5,
        scaleEnabled: true,
        constrained: true,
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
              border: (!widget.src.contains('Logo')&&!widget.src.contains(r'/A.png')&&!widget.src.contains(r'/B.png')&&!widget.src.contains(r'/C.png')&&!widget.src.contains(r'/D.png')&&!widget.src.contains(r'/E.png')&&!widget.src.contains(r'/F.png')&&!widget.src.contains(r'/G.png')&&!widget.src.contains(r'/H.png'))
                  ? Border.all(
                      width: 1,
                      color: Colors.blueAccent,
                    )
                  : null,
            ),
            child: CachedNetworkImage(
              placeholder: (context, url) => Center(
                child: SizedBox(
                  width: 40.0,
                  height: 40.0,
                  child: new CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
              fit: BoxFit.fill,
              imageUrl: widget.src,

            ),
          ),
        ),
      );
    } catch (e) {
      if (widget.src.contains("Logo"))
        return InteractiveViewer(
          child: Center(
            child: CachedNetworkImage(
              imageUrl: widget.src,
              height: 80,
              width: 120,
            ),
          ),
        );
      else
        return InteractiveViewer(
            child: Center(
          child: CachedNetworkImage(
            imageUrl: widget.src,
            height: 80,
            width: 80,
          ),
        ));
    }
  }
}

Future<List<Comment>> getComments(int id) async {
  List<Comment> comments = [];
  var _comments = await NetworkHelper(
      'https://dev.factwatch.org/wp-json/wp/v2/comments?per_page=100&post=${id}&_fields=author_name,author_url,date,content')
      .getData();
  for (var comment in _comments) {
    print(comment['content']['rendered']);
    comments.add(Comment(comment['author_name'], comment['author_url'],
        comment['content']['rendered'], comment['date']));
  }
  return comments;
}
