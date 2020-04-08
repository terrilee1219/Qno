/// Landing page/home screen of a logged in user.
/// The home screen will be where the user scans the nfc from.

//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

//Provider Imports
import 'package:qnoclient/providers/auth.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //Runtime variable
    var deviceSize = MediaQuery.of(context).size;

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
                Assets.nfcIcon,
                color: Colors.black,
                height: 170,
                width: 170,
              )),
          SizedBox(
            height: deviceSize.height * 0.06,
          ),
          Text("Approach the Qno machine",
              style: Theme.of(context)
                  .textTheme
                  .headline6
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
                  .headline6
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
