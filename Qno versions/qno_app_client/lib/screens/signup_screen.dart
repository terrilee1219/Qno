//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:qnoclient/constants/theme_colors.dart';


//Widget Imports
import '../widgets/signup_form.dart';
import '../widgets/divider_with_center_text.dart';
import '../widgets/rich_text_button.dart';
import '../widgets/social_media_buttons.dart';

//Modal Imports
import '../Modals/User.dart';

//Screen Imports


class SignupScreen extends StatefulWidget {
  //Screen routeName
  static const String routeName = "/signup-screen";


  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //Class states
  var _formKey = GlobalKey<FormState>();
  User _user = User();

  void signUp(){
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      print(_user.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    //In app variables
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.06,),
            Text("Sign in", style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: "Numans", fontSize: 24),),
            SizedBox(height: deviceSize.height * 0.02,),
            Text("Free yourself from queues.", style: TextStyle(color: ThemeColors.lightGrey, fontFamily: "Lato", fontSize: 14)),
            SizedBox(height: deviceSize.height * 0.08),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SignupForm(formKey: _formKey, user: _user, onSubmit: signUp),
            ),
          ],
        ),
      )
    );
  }
}
