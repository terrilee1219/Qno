//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qnoclient/providers/auth.dart';

//Constants Imports
import '../constants/theme_colors.dart';

class ForgotPasswordScreen extends StatefulWidget {
  //Class Variables
  static const String routeName = "/forgot-password-screen";

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  //Class states
  static final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email = "";

  void submitEmail() async {
    //Get rid of keyboard on pressed enter
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();

    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        await Provider.of<AuthService>(context, listen: false)
            .sendPasswordChangeEmail(_email);

        //Notify user of email being sent
        await showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text("Email sent"),
                content: Text("Check your junk folder if you do not see it."),
                actions: [
                  FlatButton(
                    child: Text("Okay"),
                    onPressed: () {
                      Navigator.of(ctx).pop();
                      Navigator.of(ctx).pop();
                    },
                  )
                ],
              );
            });
      } catch (error) {
        if (error.code == "ERROR_USER_NOT_FOUND") {
          await showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("A user with that email does not exist."),
                  actions: [
                    FlatButton(
                      child: Text("Okay"),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                );
              });
        } else if (error.code == "ERROR_INVALID_EMAIL") {
          await showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text("Invalid email. Please try again."),
                  actions: [
                    FlatButton(
                      child: Text("Okay"),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                );
              });
        } else {
          await showDialog(
              context: context,
              builder: (ctx) {
                return AlertDialog(
                  title: Text("Error"),
                  content: Text(error.message),
                  actions: [
                    FlatButton(
                      child: Text("Okay"),
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                    )
                  ],
                );
              });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: deviceSize.width,
        height: deviceSize.height,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Forgot your password?",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: "Numans",
                    fontSize: 24),
              ),
              SizedBox(
                height: deviceSize.height * 0.02,
              ),
              Text("We'll send you an email to change it.",
                  style: TextStyle(
                      color: ThemeColors.lightGrey,
                      fontFamily: "Lato",
                      fontSize: 14)),
              SizedBox(height: deviceSize.height * 0.06),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Email cannot be left blank.";
                      }
                      if (!value.contains("@") || !value.contains(".")) {
                        return "Please enter a valid email address.";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _email = value.trim();
                    },
                    onFieldSubmitted: (_) => submitEmail(),
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
              SizedBox(height: deviceSize.height * 0.04),
              Container(
                width: double.infinity,
                height: deviceSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: FlatButton(
                  onPressed: () => submitEmail(),
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
              SizedBox(height: deviceSize.height * 0.02),
              Container(
                width: double.infinity,
                height: deviceSize.height * 0.06,
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(
                        fontFamily: "Numans",
                        color: ThemeColors.purpleSwatch,
                        fontSize: 20),
                  ),
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                      side: BorderSide(color: ThemeColors.purpleSwatch)),
                ),
              ),
            ]),
      )),
    );
  }
}
