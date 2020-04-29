/// Landing page/home screen of a logged in user.
/// The home screen will be where the user scans the nfc from.

//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:nfc_in_flutter/nfc_in_flutter.dart';
import 'package:flutter/services.dart';
import 'dart:async';

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

  NFCReader nfc = NFCReader();
  bool _nfcSupported;
  StreamSubscription<NDEFMessage> _stream;

  //Screen Items with changing state
  String qnoText = 'Approach the Qno machine';
  String svgImage = Assets.nfcIcon;
  Color svgColour = Colors.black;

  @override
  void initState() {
    super.initState();

    //Set the state of the NFC capabilities for the device
    NFC.isNDEFSupported
        .then((bool isSupported) {
      setState(() {
        _nfcSupported = isSupported;
      });
    });
  }

  void setQnoTapped(){
    _stream?.cancel();
    setState(() {
      qnoText = 'Tapped!';
      svgImage = Assets.tick;
      svgColour = Colors.green;
      _stream = null;
    });
    Feedback.forTap(context);
    HapticFeedback.heavyImpact();
  }

  @override
  Widget build(BuildContext context) {

  //Runtime variable
  var deviceSize = MediaQuery.of(context).size;

    //Message Displayed if User Does Not Have NFC
    if(_nfcSupported != null){
      if(!_nfcSupported) {
        return CustomAlertDialog(
          messageTitle: "NFC Not Supported",
          message: 'Your Mobile Device Does Not Support NFC',
        );
      } else {
        _stream = NFC.readNDEF(
          once: true,
          throwOnUserCancel: false,
        ).listen((NDEFMessage message) {
          String result = '${message.payload}'.substring(2); //Substring to remove 'en' from tag payload message. i.e enTagTapped -> TagTapped
          nfc.connectToServer(result);
          setQnoTapped();
        }, onError: (e) {

          // error handling
          print('Error: $e');
        });
      }
    }

    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: deviceSize.height * 0.14,
          ),
          GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(
                svgImage,
                color: svgColour,
                height: 170,
                width: 170,
              )),
          SizedBox(
            height: deviceSize.height * 0.06,
          ),
          Text("$qnoText",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.black.withOpacity(0.6))),
          SizedBox(
            height: deviceSize.height * 0.1,
          ),
          Container(
            width: 250,
            child: Divider(
              thickness: 1.5,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
          Text("Welcome to Qno",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .copyWith(color: Colors.black.withOpacity(0.6))),
          Container(
            width: 250,
            child: Divider(
              thickness: 1.5,
              color: Colors.black.withOpacity(0.3),
            ),
          ),
        ],
      ),
    );
  }
}
