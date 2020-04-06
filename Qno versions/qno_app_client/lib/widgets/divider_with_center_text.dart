import 'package:flutter/material.dart';
import '../constants/theme_colors.dart';

class DividerWithText extends StatelessWidget {
  //Class Variables
  final String text;

  DividerWithText({this.text = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Divider(height: 1, color: ThemeColors.lightGrey, thickness: 0.5,),
          (text.isNotEmpty) ?
          Container(
            alignment: Alignment.center,
            width: text.length * 10.0 + 30,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                text,
                style: TextStyle(color: ThemeColors.lightGrey, fontSize: 12, fontFamily: "Lato"),
              ),
            ),
          ) : Container()
        ],
      ),
    );
  }
}
