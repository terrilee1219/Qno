//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:qnoclient/constants/theme_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  //Class Variables
  static const String routeName = "/forgot-password-screen";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var deviceSize = MediaQuery.of(context).size;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        title: Text(
          "Forgot your password?",
          style: Theme.of(context)
              .textTheme
              .subtitle1
              .copyWith(color: ThemeColors.purpleSwatch),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: ThemeColors.purpleSwatch,
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: deviceSize.width,
        height: deviceSize.height - 200,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Enter your email below",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Numans",
                    fontSize: 24),
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Text("We'll send you an email to change your password!",
                  style: TextStyle(
                      color: ThemeColors.lightGrey,
                      fontFamily: "Lato",
                      fontSize: 14)),
              SizedBox(height: deviceSize.height * 0.06),
              Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Password cannot be left blank.";
                      }
                      return null;
                    },
                    obscureText: true,

                    //focusNode: _passwordFocusNode,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.purpleSwatch, width: 1)),
                        hintStyle: TextStyle(
                            fontFamily: "Lato",
                            fontSize: 14,
                            color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: ThemeColors.purpleSwatch, width: 1)),
                        contentPadding: EdgeInsets.all(10),
                        hintText: "Email"),
                  ),
                ),
              ),
              SizedBox(height: deviceSize.height * 0.03),
              Container(
                width: double.infinity,
                height: deviceSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: FlatButton(
                  onPressed: () {},
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        fontFamily: "Numans",
                        color: Colors.white,
                        fontSize: 20),
                  ),
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ]),
      )),
    );
  }
}
