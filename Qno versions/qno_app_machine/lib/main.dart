import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'constants/theme_colors.dart';

//Providers
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: Orders())],
      child: MaterialApp(
        title: "Qno",
        theme: ThemeData(
            primarySwatch: ThemeColors.purpleSwatch, fontFamily: "Roboto"),
        //home: HomeScreen(),
        routes: {
          HomeScreen.routeName: (ctx) => HomeScreen(),
        },
      ),
    );
  }
}
