import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';
import '../constants/theme_colors.dart';

class SocialMediaButtons extends StatelessWidget {
  //Button Variables
  static const double buttonSize = 40;
  final CurrentState state;

  SocialMediaButtons({@required this.state});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              //Auth code here
            },
            child: SvgPicture.asset(Assets.googleIcon, height: buttonSize, width: buttonSize, color: ThemeColors.purpleSwatch,),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              //Auth code here
            },
            child: SvgPicture.asset(Assets.facebookIcon, height: buttonSize, width: buttonSize, color: ThemeColors.purpleSwatch,),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              //Auth code here
            },
            child: SvgPicture.asset(Assets.twitterIcon, height: buttonSize, width: buttonSize, color: ThemeColors.purpleSwatch,),
          ),
          SizedBox(width: 20,),
          GestureDetector(
            onTap: (){
              //Auth code here
            },
            child: SvgPicture.asset(Assets.guestIcon, height: buttonSize, width: buttonSize, color: ThemeColors.purpleSwatch,),
          )
        ],
      ),
    );
  }
}

enum CurrentState{
  Signup,
  Signin
}