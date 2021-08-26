import 'dart:convert';

import 'package:fact_watch/models/Comment.dart';
import 'package:fact_watch/models/User.dart';
import 'package:fact_watch/networking/networking.dart';
import 'package:fact_watch/screens/userInfoPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import '../functions/functionalities.dart';

class AddCommentsScreen extends StatefulWidget {
  final int id;
  AddCommentsScreen(this.id);
  @override
  _AddCommentsScreenState createState() => _AddCommentsScreenState();
}

class _AddCommentsScreenState extends State<AddCommentsScreen> {
  TextEditingController comment = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).padding.bottom);
    // return Column(
    //     children: <Widget>[
    //       FutureBuilder(
    //           future: getComments(widget.id),
    //           builder: (context, AsyncSnapshot snapshot) {
    //             if (!snapshot.hasData) {
    //               return SizedBox(
    //
    //                 child: Center(
    //                   child: CircularProgressIndicator(),
    //                 ),
    //                 height: 50,
    //               );
    //             } else {
    //               return SingleChildScrollView(
    //                 child: ListView.builder(
    //                     shrinkWrap: true,
    //                     itemCount: (snapshot as AsyncSnapshot)
    //                         .data
    //                         .length,
    //                     itemBuilder: (context, index) {
    //                       try {
    //                         var date =snapshot.data[index].date.toString();
    //                         date = new DateFormat("MMMM d, yyyy h:mma")
    //                             .format(DateTime.parse(date));
    //                         snapshot.data[index].date = date;
    //                       } catch (e) {}
    //                       print(snapshot.data[index]);
    //                       return Card(
    //                         child: getCommentCard(snapshot.data[index]),
    //                       );
    //                     }),
    //               );
    //             }
    //           }),
    //       Padding(
    //         padding: EdgeInsets.only(bottom: 10),
    //         child: Row(
    //           mainAxisSize: MainAxisSize.max,
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Divider(),
    //             Padding(
    //               padding: EdgeInsets.only(left: 5, right: 5),
    //               child: Align(
    //                 alignment: Alignment.centerLeft,
    //                 child: Icon(Icons.person,size: 24,),
    //               ),
    //             ),
    //             Expanded(
    //               child: Align(
    //                 alignment: Alignment.center,
    //                 child: TextField(
    //                   controller: comment,
    //                   decoration: InputDecoration(),
    //                   style: TextStyle(
    //                     fontSize: 20,
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.symmetric(horizontal: 10),
    //               child: InkWell(
    //                 child: Icon(
    //                   Icons.send,
    //                   size: 24,
    //                 ),
    //                 onTap: () async {
    //                   User user=Functionalities.user;
    //                   if(user.name=="" || user.email==""){
    //                     Navigator.push(context,MaterialPageRoute(builder: (context)=>UserInfoPage(comment:true,homePage: false,)));
    //                   }
    //                   else {
    //                     String commentContent=comment.text;
    //                     comment.text="";
    //                     var response = await postData(
    //                         commentContent,widget.id);
    //
    //                     print(response);}
    //                 },
    //               ),
    //             )
    //           ],
    //         ),
    //       ),
    //
    //
    //     ],
    //
    //
    // );
    return DraggableScrollableSheet(
        maxChildSize: 0.8,
        expand: false,
        initialChildSize: 0.8,
        minChildSize: 0.8,

        builder: (BuildContext context,
            ScrollController scrollController) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [

              FutureBuilder(
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    return Expanded(
                      child: ListView.builder(
                          itemCount: (snapshot).data.length,
                          itemBuilder: (context, index) {
                            try {
                              var date = snapshot.data[index].date.toString();
                              date = new DateFormat("MMMM d, yyyy h:mma")
                                  .format(DateTime.parse(date));
                              snapshot.data[index].date = date;
                            } catch (e) {}
                            print(snapshot.data[index]);
                            return Card(
                              child: getCommentCard(snapshot.data[index]),
                            );
                          }),
                    );
                  } else {
                    return Expanded(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  }
                },
                future: getComments(widget.id),
              ),
          SizedBox(height: 2,width: double.infinity,child: Container(
            padding: EdgeInsets.symmetric(vertical: 5),
            color: Colors.blue,
          ),),
          Padding(
                  padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom+5,),

                  child: Row(

                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Divider(),
                      Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.person,size: 24,),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: TextField(
                            autofocus: true,
                            controller: comment,
                            decoration: InputDecoration(),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: InkWell(
                          child: Icon(
                            Icons.send,
                            size: 24,
                          ),
                          onTap: () async {
                            User user=Functionalities.user;
                            if(user.name=="" || user.email==""){
                              Navigator.push(context,MaterialPageRoute(builder: (context)=>UserInfoPage(comment:true,homePage: false,)));
                            }
                            else {
                              String commentContent=comment.text;
                              comment.text="";
                              var response = await postData(
                                  commentContent,widget.id);

                              print(response);
                              setState(() {

                              });
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ),
            ],
          );
          // return Padding(
          //     padding: MediaQuery.of(context)
          //         .viewInsets,
          //     child: AddCommentsScreen(
          //         widget.news!.id));

        },

    );
  }
}

Widget getCommentCard(Comment comment) => Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 5, top: 5),
            child:
                Align(alignment: Alignment.topLeft, child: Icon(Icons.person))),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.all(0),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Functionalities.launchURL(comment.authorLink);
                    },
                    child: Text(
                      comment.author + " says: ",
                      style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "BalooDa2"),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(comment.comment.substring(
                    comment.comment.indexOf("<p>") + 3,
                    comment.comment.lastIndexOf("</p>")),style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "BalooDa2"),),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      comment.date,
                      style:
                          TextStyle(fontSize: 10, fontStyle: FontStyle.italic,fontFamily: "Kalpurush"),
                    ))),
          ]),
        ),
      ],
    );

Future<dynamic> postData(String comment, int id) async {
  //Uri.https("192.168.1.30:5000", "/api/data")
  //Uri.parse("your url");
  final Uri uri = Uri.http("www.dev.factwatch.org", "wp-json/wp/v2/comments?post=${id.toString()}&");
  final response = await http.post(
    uri,
    body: {
      "content": comment,
      "author_email": Functionalities.user.email,
      "author_name": Functionalities.user.name,
      "website": Functionalities.user.website
    },
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
  );
  return response.body;
}

Future<List<Comment>> getComments(int id) async {
  List<Comment> comments = [];
  var _comments = await NetworkHelper(
          'https://dev.factwatch.org/wp-json/wp/v2/comments?per_page=100&post=$id&_fields=author_name,author_url,date,content')
      .getData();
  for (var comment in _comments) {
    print(comment['content']['rendered']);
    comments.add(Comment(comment['author_name'], comment['author_url'],
        comment['content']['rendered'], comment['date']));
  }
  return comments;
}
