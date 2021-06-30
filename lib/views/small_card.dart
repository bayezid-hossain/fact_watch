import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String text;
  SmallCard(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            text,
            style: TextStyle(fontSize: 12),
          ),
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
          //borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
