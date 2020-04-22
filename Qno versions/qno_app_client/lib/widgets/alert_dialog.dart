import 'package:flutter/material.dart';
import '../constants/theme_colors.dart';

class CustomAlertDialog extends StatelessWidget {
  final String messageTitle;
  final String message;

  CustomAlertDialog({this.messageTitle, this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          messageTitle,
          style: Theme.of(context)
              .textTheme
              .headline
              .copyWith(color: ThemeColors.purpleSwatch),
        ),
      ),
      content: Text("Your Mobile Device Does Not Support NFC."),
      actions: [],
    );
  }
}
