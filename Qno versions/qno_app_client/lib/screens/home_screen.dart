/// Landing page/home screen of a logged in user.
/// The home screen will be where the user scans the nfc from.

//Imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:qnoclient/providers/auth.dart';
import 'package:qnoclient/screens/signup_screen.dart';
import '../constants/app_assets.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "/home-screen";

  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Provider.of<AuthService>(context, listen: false).signOut();
                Navigator.of(context).pushReplacementNamed(SignupScreen.routeName);
              },
              child: SvgPicture.asset(Assets.nfcIcon, color: Colors.black, height: 170, width: 170,)
            ),
            SizedBox(height: 25,),
            Text("Approach the Qno machine", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black.withOpacity(0.6))),
            SizedBox(height: 70,),
            Container(
              width: 250,
              child: Divider(
                thickness: 1.5,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
            Text("Welcome to Qno", style: Theme.of(context).textTheme.headline6.copyWith(color: Colors.black.withOpacity(0.6))),
            Container(
              width: 250,
              child: Divider(
                thickness: 1.5,
                color: Colors.black.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}