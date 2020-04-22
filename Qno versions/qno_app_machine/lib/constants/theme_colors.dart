import 'package:flutter/material.dart';

class ThemeColors{

  //Custom purple material color
  static const Map<int, Color> _purpleOpacityDegrees =
  {
    50:Color.fromRGBO(74,20,188, .1),
    100:Color.fromRGBO(74,20,188, .2),
    200:Color.fromRGBO(74,20,188, .3),
    300:Color.fromRGBO(74,20,188, .4),
    400:Color.fromRGBO(74,20,188, .5),
    500:Color.fromRGBO(74,20,188, .6),
    600:Color.fromRGBO(74,20,188, .7),
    700:Color.fromRGBO(74,20,188, .8),
    800:Color.fromRGBO(74,20,188, .9),
    900:Color.fromRGBO(74,20,188, 1),
  };

  static const MaterialColor purpleSwatch = MaterialColor(0xFF4A14BC, _purpleOpacityDegrees);

  //Additional colors
  static const Color lightGrey = Color(0xFFE8E8E8);


}