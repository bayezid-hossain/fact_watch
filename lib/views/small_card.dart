import 'package:flutter/material.dart';

class SmallCard extends StatelessWidget {
  final String text;
  SmallCard(this.text);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 5),
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(3),
          child: Center(
            child: Text(
              text,
              style: TextStyle(fontSize: 10),
            ),
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
