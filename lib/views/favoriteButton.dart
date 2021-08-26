import 'package:flutter/material.dart';
import '../functions/functionalities.dart';
import '../models/News.dart';
class FavoriteButton extends StatefulWidget {
  final News? news;
  final bool removeTile;
  final Function function;
  FavoriteButton({this.news,required this.removeTile,required this.function});
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        widget.removeTile?Icons.remove:Icons.bookmark_border,
        size: 22,
        color: widget.removeTile?Colors.red:(Functionalities.favoriteNews.favoriteNews.contains(widget.news!.id)?Colors.amberAccent:Colors.black),

      ),
      onTap: ()  {
        if(widget.removeTile==true)widget.function();
        else{if(Functionalities.favoriteNews.favoriteNews.contains(widget.news!.id))showDialog(
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
        ).then((val) {
          setState((){
            if(val=='ok'){Functionalities.favoriteNews.remove(widget.news!.id);
            Functionalities.loadFavorites();
            Functionalities.setFavorites();
            };

          });
        });
        else{
          setState(() {
            Functionalities.favoriteNews.add(widget.news!.id);
            Functionalities.setFavorites();
            Functionalities.loadFavorites();
          });
        }
      }},
    );
  }
}
