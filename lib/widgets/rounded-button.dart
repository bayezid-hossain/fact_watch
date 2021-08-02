import 'package:flutter/material.dart';
import 'package:fact_watch/pallete.dart';
import 'package:flutter_html/shims/dart_ui.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({

    required this.buttonName,
    required this.function,
  });

  final String buttonName;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: kBlue,
      ),
      child: FlatButton(
        color: Colors.lightBlueAccent,
        textColor: Colors.black45,
        onPressed:function,
        child: Text(
          buttonName,
          style: kBodyText.copyWith(fontWeight: FontWeight.bold,color: Colors.black45),
        ),
      ),
    );
  }
}
