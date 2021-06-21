import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fact_watch/News.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:share/share.dart';
import 'functionalities.dart';
import 'add_comments_screen.dart';
import 'Comment.dart';
import 'networking/networking.dart';
import 'favoriteButton.dart';
class IndividualNews extends StatefulWidget {
  final News? news;

  IndividualNews(this.news);

  @override
  _IndividualNewsState createState() => _IndividualNewsState();
}

class _IndividualNewsState extends State<IndividualNews> {
  List<Comment> comments = [];
  int tableIndex=1;
  //double width = MediaQuery. of(widget.context). size. width;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getComments(widget.news).then((_comments) {
      comments = _comments;
    });
  }

  @override
  Widget build(BuildContext context) {
    int totalTables="<table".allMatches(widget.news!.description).length;
    bool initFav=Functionalities.favoriteNews.favoriteNews.contains(widget.news!.id);
    widget.news!.description.replaceAll("Published on: ${widget.news!.date}", "").replaceAll("width: 113.211%", "");

    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context,(initFav==Functionalities.favoriteNews.favoriteNews.contains(widget.news!.id))?false:true);
        return  false;
      },
      child: Scaffold(
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
                      size: 22,
                    ),
                    onTap: () {
                      final RenderBox box = context.findRenderObject() as RenderBox;
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
                  FavoriteButton(tableIndex: tableIndex,news: widget.news,removeTile: false,function: (){},),
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                          child: Text(
                            widget.news!.title,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        if (widget.news!.mediaLinkLarge != null)
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
                            onLinkTap: (url,_,__,___) {
                              Functionalities.launchURL(url!);
                            },
                            style: {
                              // tables will have the below background color
                              "table": Style(

                                backgroundColor: Colors.white,
                                //width: 1000,

                                width:MediaQuery. of(context). size. width,
                                border: Border.all(color: Colors.white),
                                padding: EdgeInsets.symmetric(vertical: 0),
                                margin: EdgeInsets.symmetric(vertical:0),
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
                                //width: double.maxFinite,
                              ),
                              "p": Style(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 20),
                              ),
                              "img": Style(
                                padding: EdgeInsets.symmetric(vertical: 10),
                              ),
                              "a": Style(
                                color: Colors.black,
                              )
                            },
                            //blacklistedElements: ['width'],
                            customRender: {
                              "img": (RenderContext context, Widget child) {
                                String originalPic = context.tree.attributes['src'].toString();
                                try {
                                  if (double.parse(context.tree.attributes['height'].toString()) < 300 &&
                                      double.parse(context.tree.attributes['width'].toString()) < 300) {
                                    if (!context.tree.attributes['src'].toString().contains('Stamping') &&
                                        !context.tree.attributes['src'].toString().contains('Logo')) {
                                      String src = context.tree.attributes['src'].toString();
                                      String imageName = src.substring(
                                          src.lastIndexOf('/'), src.length);
                                      imageName = imageName.substring(
                                          0, imageName.indexOf('-'));
                                      String extension = src.substring(
                                          src.lastIndexOf('.'), src.length);
                                      originalPic =
                                          src.substring(0, src.lastIndexOf('/')) +
                                              imageName +
                                              extension;
                                      //print(attributes['src']);
                                    }
                                  }
                                  //print(originalPic);

                                  return InteractiveViewsImage(
                                      context.tree.attributes, originalPic);
                                } catch (e) {
                                  print(e);
                                  // print(attributes['src']);
                                  // print(originalPic);
                                  return InteractiveViewsImage(
                                      context.tree.attributes, context.tree.attributes['src'].toString());
                                }
                              },
                              "table": (RenderContext context, Widget child,) {
                                //print("$totalTables,$tableIndex");
                                if(tableIndex==1 || tableIndex==totalTables){
                                  tableIndex++;
                                  return (context.tree as TableLayoutElement).toWidget(context);
                                }
                                tableIndex++;
                                return SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(child:(context.tree as TableLayoutElement).toWidget(context),
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),),
                                  clipBehavior: Clip.antiAliasWithSaveLayer,
                                );
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        // isScrollControlled: true,
                        elevation: 10,
                        context: context,
                        builder: (context) =>
                            AddCommentsScreen(comments, context, widget.news!.id));
                  },
                  child: Text(
                    "মতামত জানান",
                    style: TextStyle(fontSize: 22),
                  ),
                ),
                SizedBox(
                  height: 10,
                )
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
    bool panEnabled=false;
    // print(src);
    // print(attributes['src']);

    return InteractiveViewer(
      minScale: 1,
      onInteractionUpdate: (ScaleUpdateDetails scal){
        var myScale=scal.scale;
        if(myScale>1 && panEnabled==false){
          setState(() {
            panEnabled=true;
          });
        }
        else if(myScale<=1 && panEnabled==true){
          setState(() {
            panEnabled=false;
          });
        }
      },
      panEnabled: panEnabled,
      maxScale: 2.5,
      scaleEnabled: true,
      constrained: true,
      boundaryMargin: EdgeInsets.all(40),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(2.0)),
            border: (!widget.src.contains("Stamping") && !widget.src.contains('Logo'))
                ? Border.all(
                    width: 1,
                    color: Colors.blueAccent,
                  )
                : null,
          ),
          height: (double.parse(widget.attributes['height'].toString()) > 600)
              ? 600
              : double.parse(widget.attributes['height'].toString()),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
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
              width: widget.attributes['src'].toString().contains("Stamping")
                  ? 80
                  : double.parse(widget.attributes['width'].toString()),
              height: widget.attributes['src'].toString().contains("Stamping")
                  ? 80
                  : ((double.parse(widget.attributes['height'].toString()) < 400)
                      ? 600
                      : double.parse(widget.attributes['height'].toString())),
            ),
          ),
        ),
      ),
    );
  }
}

Future<List<Comment>> getComments(News? news) async {
  List<Comment> comments = [];
  var _comments = await NetworkHelper(
          'https://www.fact-watch.org/web/wp-json/wp/v2/comments?post=${news!.id}&_fields=author_name,author_url,date,content')
      .getData();
  for (var comment in _comments) {
    comments.add(Comment(comment['author_name'], comment['author_url'],
        comment['content']['rendered'], comment['date']));
  }
  return comments;
}

