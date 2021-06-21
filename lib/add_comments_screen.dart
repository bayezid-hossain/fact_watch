import 'dart:convert';

import 'package:fact_watch/Comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'functionalities.dart';

class AddCommentsScreen extends StatefulWidget {
  final List<Comment> comments;
  final int id;
  final BuildContext context;
  AddCommentsScreen(this.comments, this.context, this.id);
  @override
  _AddCommentsScreenState createState() => _AddCommentsScreenState();
}

class _AddCommentsScreenState extends State<AddCommentsScreen> {
  late String commentText;
  @override
  Widget build(BuildContext context) {
    //print(MediaQuery.of(context).padding.bottom);
    return Container(
      padding: EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.comments.length,
                itemBuilder: (context, index) {
                  try {
                    var date = widget.comments[index].date.toString();
                    date = new DateFormat("MMMM d, yyyy h:mma")
                        .format(DateTime.parse(date));
                    widget.comments[index].date = date;
                  } catch (e) {}

                  return Card(
                    child: getCommentCard(widget.comments[index]),
                  );
                }),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.person),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      onChanged: (value) {
                        commentText = value;
                      },
                      decoration: InputDecoration(),
                    ),
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.send,
                    size: 20,
                  ),
                  onTap: () async {
                    var response = await postData(
                        commentText, "", "", widget.id, "website");
                    print(response);
                  },
                )
              ],
            ),
          ),
        ],
      ),
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
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Functionalities.launchURL(comment.authorLink);
                    },
                    child: Text(
                      comment.author + " says: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(comment.comment.substring(
                    comment.comment.indexOf("<p>") + 3,
                    comment.comment.lastIndexOf("</p>"))),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      comment.date,
                      style:
                          TextStyle(fontSize: 10, fontStyle: FontStyle.italic),
                    ))),
          ]),
        ),
      ],
    );

Future<dynamic> postData(
    String comment, String email, String name, int id, String website) async {
  //Uri.https("192.168.1.30:5000", "/api/data")
  //Uri.parse("your url");
  final Uri uri = Uri.http("www.fact-watch.org", "/web/wp-comments-post.php");
  final response = await http.post(
    "https://www.fact-watch.org/web/wp-json/wp/v2/comments?post=${id.toString()}&",
    body: {
      "comment": comment,
      "email": email,
      "author_name": name,
      "submit": "Post+Comment",
    },
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    encoding: Encoding.getByName('utf-8'),
  );
  return response.body;
}
