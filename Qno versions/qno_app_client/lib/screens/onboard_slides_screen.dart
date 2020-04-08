//Imports
//Package Imports
import 'package:flutter/material.dart';

//Widget Imports
import '../widgets/onboard_slides_carousel.dart';

//Constant Imports
import '../constants/theme_colors.dart';

//Screen Imports
import '../screens/signup_screen.dart';
import '../screens/signin_screen.dart';

class OnboardScreen extends StatelessWidget {
  //Class States
  static const String routeName = "/onboard-screen";

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: deviceSize.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OnboardSlidesCarousel(),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignupScreen.routeName);
              },
              color: ThemeColors.purpleSwatch,
              minWidth: deviceSize.width * 0.85,
              height: 45,
              child: Text(
                "Sign up",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontFamily: "Numans",
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.025,
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(SignInScreen.routeName);
              },
              color: ThemeColors.purpleSwatch,
              minWidth: deviceSize.width * 0.85,
              height: 45,
              child: Text(
                "Sign in",
                style: Theme.of(context).textTheme.headline6.copyWith(
                      fontFamily: "Numans",
                      color: Colors.white,
                    ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.03,
            ),
          ],
        ),
      ),
    );
  }
}
