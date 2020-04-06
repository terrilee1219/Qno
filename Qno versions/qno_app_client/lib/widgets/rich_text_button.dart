import 'package:flutter/material.dart';
import '../constants/theme_colors.dart';


class RichTextButton extends StatelessWidget {
  //Button Variables
  final String normalText;
  final String highlightedText;
  final Function onPressed;

  RichTextButton({@required this.onPressed, @required this.normalText, this.highlightedText = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.all(4.0),
        child: RichText(
          text: TextSpan(
            text: normalText,
            style: TextStyle(fontFamily: "Lato", fontSize: 12, color: ThemeColors.lightGrey),
            children: <TextSpan>[
              (highlightedText.isNotEmpty) ?
              TextSpan(text: highlightedText, style: TextStyle(fontFamily: "Lato", fontSize: 12, color: ThemeColors.purpleSwatch))
              :
              TextSpan(),
            ],
          ),
        ),
      ),
    );
  }
}
