/// Qno is a smart coaster paging app designed with flutter.
/// This is Qno v0.1 and is a basic proof of concept which has no sophisticated communication between client and nfc.

//Package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//Constants
import './constants/theme_colors.dart';

//Screens
import './screens/home_screen.dart';

//Providers
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
          title: "Qno",
          theme: ThemeData(
            primarySwatch: ThemeColors.purpleSwatch,
            fontFamily: "Roboto"
          ),
          //home: HomeScreen(),
          routes: {
            HomeScreen.routeName : (ctx) => HomeScreen(),
          },
      ),
    );
  }
}
