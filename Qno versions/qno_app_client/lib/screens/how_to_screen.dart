//Imports
//Package Imports
import 'package:flutter/material.dart';

//Widget Imports
import '../widgets/onboard_slides_carousel.dart';

class HowToScreen extends StatelessWidget {
  //Class Variables
  static const String routeName = "/howto-scren";

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    var deviceSize = MediaQuery.of(context).size;

    return Column(
      children: [
        OnboardSlidesCarousel(
          includeHomePage: false,
        )
      ],
    );
  }
}
