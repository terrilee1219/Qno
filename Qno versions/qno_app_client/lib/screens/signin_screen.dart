//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:qnoclient/constants/theme_colors.dart';


//Widget Imports
import '../widgets/signin_form.dart';

//Modal Imports
import '../Modals/User.dart';

//Screen Imports
import './signup_screen.dart';

class SignInScreen extends StatefulWidget {
  //Screen route name
  static String routeName = "/signin-screen";

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  //Class states
  var _formKey = GlobalKey<FormState>();
  User _user = User();

  void signIn(){
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
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: deviceSize.height * 0.06,),
            Text("Sign in", style: TextStyle(color: Theme.of(context).primaryColor, fontFamily: "Numans", fontSize: 24),),
            SizedBox(height: deviceSize.height * 0.02,),
            Text("Free yourself from queues.", style: TextStyle(color: ThemeColors.lightGrey, fontFamily: "Lato", fontSize: 14)),
            SizedBox(height: deviceSize.height * 0.12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SigninForm(formKey: _formKey, user: _user, onSubmit: signIn),
            ),
            SizedBox(height: deviceSize.height * 0.03,),
            Container(
              width: double.infinity,
              height: deviceSize.height * 0.06,
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: FlatButton(
                onPressed: () => signIn(),
                child: Text("Sign in", style: TextStyle(fontFamily: "Numans", color: Colors.white, fontSize: 20),),
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(height: deviceSize.height * 0.03,),
            GestureDetector(
              onTap: () => Navigator.of(context).pushReplacementNamed(SignupScreen.routeName),
              child: RichText(
                text: TextSpan(
                  text: "Don\'t have an account?",
                  style: TextStyle(fontFamily: "Lato", fontSize: 12, color: ThemeColors.lightGrey),
                  children: <TextSpan>[
                    TextSpan(text: '  Sign up', style: TextStyle(fontFamily: "Lato", fontSize: 12, color: ThemeColors.purpleSwatch)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
