//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qnoclient/providers/database.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'database.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService with ChangeNotifier {
  //Auth Variables
  String _fullName; //Not being stored for now.
  String _userId;
  String _authToken;
  String _email;
  String _password;
  bool loggedIn = false;

  //Firebase Authenticator
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;


  Future signInWithEmail(String email, String password) async {
    try {
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser _firebaseUser = result.user;
      print(_firebaseUser.uid);

      //Assign other variables
      _getUserInformation(_firebaseUser);
    } catch (error) {
      rethrow;
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try {

      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser _firebaseUser = result.user;

      final Firestore _db = Firestore.instance;
      final FirebaseMessaging _fcm = FirebaseMessaging();

      String uid = _firebaseUser.uid;
      String fcmToken = await _fcm.getToken();

      var rndnumber = "";
      var rng = new Random();
      for (var i = 0; i < 10; i++) {
        rndnumber = rndnumber + rng.nextInt(9).toString();
      }
      print(rndnumber);

      var now = new DateTime.now();
      var formatter = new DateFormat('yyyy-MM-dd');
      String date = formatter.format(now);
      print(date);

      await DatabaseService(uid: uid).updateUserData( _firebaseUser.uid, int.parse(rndnumber), date, 1 );

      if(fcmToken != null){
        await DatabaseService(uid: uid).updateTokenData( _firebaseUser.uid, fcmToken);
      }


      //Assign other variables
      _getUserInformation(_firebaseUser);
    } catch (error) {
      rethrow;
    }
  }

  Future tryAutoLogin() async {
    if (await _loadUserData()) {
      loggedIn = true;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future signOut() async {
    //Clear variables
    _userId = "";
    _authToken = "";
    _email = "";
    _password = "";
    _deleteUserToPrefs();
    return _firebaseAuth.signOut();
  }

  Future sendPasswordChangeEmail(String email) async {
    try{
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    }catch(error){
      rethrow;
    }

  }

  void _getUserInformation(FirebaseUser firebaseUser) {
    _getAuthIdToken(firebaseUser);
    if (firebaseUser != null) {
      _userId = firebaseUser.uid;
      _email = firebaseUser.email;
      loggedIn = true;
    }
    notifyListeners();

    _saveUserToPrefs();
  }

  Future _getAuthIdToken(FirebaseUser firebaseUser) async {
    try {
      IdTokenResult _authIdToken =
          await firebaseUser.getIdToken(refresh: false);
      _authToken = _authIdToken.token;
    } catch (e) {
      print(e);
    }
  }


  Future _saveUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final Map<String, String> userData = {
      "userId": _userId,
      "authToken": _authToken,
      "email": _email,
      "password" : _password
    };
    prefs.setString("userData", json.encode(userData));
  }

  Future _deleteUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  /// Get the token, save it to the database for current user

  Future _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey("userData")) {
      return false;
    }

    final extractedData = json.decode(prefs.getString("userData"));
    _email = extractedData['email'];
    _authToken = extractedData['authToken'];
    _userId = extractedData['userId'];
    _password = extractedData['password'];
    return true;
  }

}
