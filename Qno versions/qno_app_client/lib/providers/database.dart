import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'auth.dart';

class DatabaseService extends StatefulWidget{
  @override
  _DatabaseServiceState createState() => _DatabaseServiceState();
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection('info');
  final CollectionReference tokenCollection = Firestore.instance.collection('tokens');

  Future updateUserData(String uid, int phoneNo, String date, int orderNo) async{
    return await userCollection.document(uid).setData({
     // 'email': email,
      'user': uid,
      'phoneNo': phoneNo,
      'creationDate': date,
      'orderNo': orderNo
    });
  }

  Future updateTokenData(String uid, String token) async{
    return await tokenCollection.document(uid).setData({
     // 'email': email,
      'user': uid,
      'token': token
    });
  }
}

class _DatabaseServiceState extends State<DatabaseService> {
  //final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();
  @override
  void initState() {
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return null;
  }

}
