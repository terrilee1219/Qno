/// Qno is a smart coaster paging app designed with flutter.
/// This is Qno v0.1 and is a basic proof of concept which has no sophisticated communication between client and nfc.


// Imports //
//Packages
import 'package:flutter/material.dart';

//Screens
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Application variables //
    //Title
    const String _title = "Qno";

    //Application Theme Mode
    var _themeMode = ThemeMode.system;

    //Application routes/screens
    Map<String, Widget Function(BuildContext)> _routes = {
      HomeScreen.routeName : (ctx) => HomeScreen(),
    };

    // Application Theme //
    var _textTheme = TextTheme(
      headline2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold
      ),
      headline3: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold
      ),
    );

    var _appBarTheme = AppBarTheme(

    );

    var _applicationTheme = ThemeData(
      textTheme: _textTheme,
      appBarTheme: _appBarTheme,
    );

    return MaterialApp(
      title: _title,
      themeMode: _themeMode,
      routes: _routes,
      theme: _applicationTheme,
    );
  }
}
