/// Qno is a smart coaster paging app designed with flutter.
/// This is Qno v0.1 and is a basic proof of concept which has no sophisticated communication between client and nfc.

//Package Imports
import 'package:flutter/material.dart';

//Screens
import './screens/home_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Qno",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomeScreen(), //Set the current screen being developed.
      routes: {
        //HomeScreen.routeName : (ctx) => HomeScreen(),
      },
    );
  }
}
