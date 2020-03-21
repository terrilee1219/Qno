import 'package:firebase_messaging/firebase_messaging.dart';
/// Landing page/home screen of a logged in user.
/// The home screen will be where the user scans the nfc from.

//Imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:qno_v01/constants/theme_colors.dart';
import '../constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "/";

  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  var _deviceToken;

  void showInSnackBar() {
      _scaffoldKey.currentState.showSnackBar(new SnackBar(content: new Text("Hello user ID: \n${_deviceToken.toString()}")));
  }

  getToken() {
      _firebaseMessaging.getToken().then((deviceToken) => setState(() { _deviceToken = deviceToken; }));
  }

  @override
  void initState() { 
    super.initState();
    getToken();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: () => showInSnackBar(),
              child: SvgPicture.asset(Assets.nfcIcon, color: ThemeColors.primaryColor, height: 170, width: 170,)
            ),
            SizedBox(height: 25,),
            Text("Approach the Qno machine", style: Theme.of(context).textTheme.headline3),
            SizedBox(height: 70,),
            Container(
              width: 250,
              child: Divider(
                thickness: 1.5,
                color: ThemeColors.primaryColor.withOpacity(0.3),
              ),
            ),
            Text("Welcome to Qno", style: Theme.of(context).textTheme.headline2),
            Container(
              width: 250,
              child: Divider(
                thickness: 1.5,
                color: ThemeColors.primaryColor.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}