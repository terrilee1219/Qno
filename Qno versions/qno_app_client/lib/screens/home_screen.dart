/// Landing page/home screen of a logged in user.
/// The home screen will be where the user scans the nfc from.

//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//Provider Imports
import 'package:qnoclient/providers/auth.dart';
import 'package:qnoclient/providers/nfc.dart';
import 'package:qnoclient/screens/signup_screen.dart';
import 'package:qnoclient/widgets/alert_dialog.dart';

//Constant Imports
import '../constants/app_assets.dart';

//Screen Imports
import 'package:qnoclient/screens/onboard_slides_screen.dart';

class HomeScreen extends StatefulWidget {
  static final String routeName = "/home-screen";

  const HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _nfcSupported;
  NFCReader nfc = NFCReader();

  @override
  void initState() { 
    super.initState();

    //Set the state of the NFC capabilities for the device
    nfc.getNfcSupport().then((bool result){
      setState(() {
        _nfcSupported = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //Message Displayed if User Does Not Have NFC
    if(_nfcSupported != null){
      if(!_nfcSupported) {
        return CustomAlertDialog(
          messageTitle: "NFC Not Supported",
          message: 'Your Mobile Device Does Not Support NFC',
        );
      } else {
        nfc.readNFC(); //Open NFC Stream and Wait for Tap
      }
    }

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
                Navigator.of(context).pushReplacementNamed(OnboardScreen.routeName);
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