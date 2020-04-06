//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService with ChangeNotifier{
  //Auth Variables
  //String _fullName; Not being stored for now.
  String _userId;
  IdTokenResult _authIdToken;
  String _email;
  FirebaseUser _firebaseUser;

  //Firebase Authenticator
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future signInWithEmail(String email, String password) async{
    try{
      AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      _firebaseUser = result.user;

      //Assign other variables
      _getUserInformation();
    }catch(error){
      rethrow;
    }
  }

  Future signUpWithEmail(String email, String password) async {
    try{
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      _firebaseUser = result.user;

      //Assign other variables
      _getUserInformation();
    }
    catch(error){
      rethrow;
    }
  }

  Future signOut() async {
    return _firebaseAuth.signOut();
  }

  void _getUserInformation(){
    _getAuthIdToken();
    if(_firebaseUser != null){
      _userId = _firebaseUser.uid;
      _email = _firebaseUser.email;
    }
    notifyListeners();
  }

  Future _getAuthIdToken() async{
    try{
      IdTokenResult _authIdToken = await _firebaseUser.getIdToken(refresh: false);
    }catch(e){
      print(e);
    }

  }
}