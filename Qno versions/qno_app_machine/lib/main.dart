import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dismissible',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'QNO HealthCare Kiosk'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //real data here
  final itemsList = List<String>.generate(10, (n) => "073019561${n}");

  ListView generateItemsList() {
    return ListView.builder(
      itemCount: itemsList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: Key(itemsList[index]),
          child: InkWell(
              onTap: () {
                print("${itemsList[index]} clicked");
              },
              child: ListTile(title: Text('${itemsList[index]}'))),
          background: slideLeftBackground(),
          secondaryBackground: slideLeftBackground(),
          onDismissed: (direction){
            writeUserData(itemsList[index]);
            itemsList.removeAt(index);
            },
        );
    },
    );
  }

   void  writeUserData (String phoneNo) async {
     var now = new DateTime.now();
     dynamic dateTime = new DateFormat("dd-MM-yyyy hh:mm:ss").format(now);

     final db = Firestore.instance;
     db.collection("requests").document().setData({"phoneNo": phoneNo, "subDate" : dateTime});
}


  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: generateItemsList(),
    );
  }
}