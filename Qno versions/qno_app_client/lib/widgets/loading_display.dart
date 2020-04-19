import 'package:flutter/material.dart';
import '../constants/theme_colors.dart';

class LoadingDisplay extends StatelessWidget {
  AuthType _type;

  LoadingDisplay(AuthType type) {
    _type = type;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (_type == AuthType.signIn)
              ? Text(
                  "Signing you in!",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(color: ThemeColors.purpleSwatch),
                )
              : Text(
                  "Signing you up!",
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .copyWith(color: ThemeColors.purpleSwatch),
                ),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}

enum AuthType { signUp, signIn }
