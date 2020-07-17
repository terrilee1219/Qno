import 'package:flutter/material.dart';

class ThemeColors{

  //Custom purple material color
  static const Map<int, Color> _purpleOpacityDegrees =
  {
    50:Color.fromRGBO(106, 27, 154, .1),
    100:Color.fromRGBO(106, 27, 154, .2),
    200:Color.fromRGBO(106, 27, 154, .3),
    300:Color.fromRGBO(106, 27, 154, .4),
    400:Color.fromRGBO(106, 27, 154, .5),
    500:Color.fromRGBO(106, 27, 154, .6),
    600:Color.fromRGBO(106, 27, 154, .7),
    700:Color.fromRGBO(106, 27, 154, .8),
    800:Color.fromRGBO(106, 27, 154, .9),
    900:Color.fromRGBO(106, 27, 154, 1),
  };

  static const MaterialColor purpleSwatch = MaterialColor(0xFF6A1B9A, _purpleOpacityDegrees);

  //Additional colors
  static const Color lightGrey = Color(0xFFE8E8E8);


}