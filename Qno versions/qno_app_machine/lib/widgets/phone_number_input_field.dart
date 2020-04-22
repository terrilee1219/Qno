import 'package:flutter/material.dart';
import 'package:machine/constants/theme_colors.dart';

class PhoneNumberInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.58,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: ThemeColors.lightGrey,
      ),
    );
  }
}
