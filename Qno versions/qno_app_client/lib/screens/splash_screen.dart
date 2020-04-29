import 'package:flutter/material.dart';
import 'package:qnoclient/constants/theme_colors.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "QNO", style: Theme.of(context).textTheme.headline.copyWith(color: ThemeColors.purpleSwatch),
        ),
      ),
    );
  }
}
