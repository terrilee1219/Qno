/// Qno is a smart coaster paging app designed with flutter.
/// This is Qno v0.1 and is a basic proof of concept which has no sophisticated communication between client and nfc.

//Package Imports
import 'package:flutter/material.dart';

//Constants
import './constants/theme_colors.dart';

//Screens
import './screens/home_screen.dart';
import './screens/signin_screen.dart';
import './screens/signup_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qno",
      theme: ThemeData(
        primarySwatch: ThemeColors.purpleSwatch,
      ),
      //home: HomeScreen(), Set the current screen being developed.
      home: SignInScreen(),
      routes: {
        HomeScreen.routeName : (ctx) => HomeScreen(),
        SignInScreen.routeName : (ctx) => SignInScreen(),
        SignupScreen.routeName : (ctx) => SignupScreen(),
      },

    );
  }
}
