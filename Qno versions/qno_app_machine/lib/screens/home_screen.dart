//Imports
//Packages
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  //Class Variables
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
