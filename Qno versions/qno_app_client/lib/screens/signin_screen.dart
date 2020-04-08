//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../constants/theme_colors.dart';

//Widget Imports
import '../widgets/signin_form.dart';
import '../widgets/divider_with_center_text.dart';
import '../widgets/rich_text_button.dart';
import '../widgets/social_media_buttons.dart';
import '../widgets/loading_display.dart';

//Modal Imports
import '../Modals/User.dart';

//Screen Imports
import './signup_screen.dart';
import './hamburger_container_screen.dart';

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
  bool _isLoading = false;

  void signIn() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      try {
        await Provider.of<AuthService>(context, listen: false)
            .signInWithEmail(_user.email, _user.password)
            .then((value) {
          setState(() {
            _isLoading = false;
          });
          Navigator.of(context).pushReplacementNamed(HamburgerContainerScreen.routeName);
        });
      } catch (error) {
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
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }

    //Get rid of keyboard on pressed enter
    FocusScopeNode currentFocus = FocusScope.of(context);
    currentFocus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    //In app variables
    var deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: (_isLoading)
          ? LoadingDisplay(AuthType.signIn)
          : SingleChildScrollView(
              child: Container(
                width: deviceSize.width,
                height: deviceSize.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: deviceSize.height * 0.06,
                    ),
                    Text(
                      "Sign in",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontFamily: "Numans",
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.02,
                    ),
                    Text("Free yourself from queues.",
                        style: TextStyle(
                            color: ThemeColors.lightGrey,
                            fontFamily: "Lato",
                            fontSize: 14)),
                    SizedBox(height: deviceSize.height * 0.12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: SigninForm(
                          formKey: _formKey, user: _user, onSubmit: signIn),
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.01,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 25),
                      alignment: Alignment.centerRight,
                      child: RichTextButton(
                        onPressed: () {
                          print("Password Forgotten");
                        },
                        normalText: "Forgot your password?",
                      ),
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.03,
                    ),
                    Container(
                      width: double.infinity,
                      height: deviceSize.height * 0.06,
                      padding: EdgeInsets.symmetric(horizontal: 25),
                      child: FlatButton(
                        onPressed: () => signIn(),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                              fontFamily: "Numans",
                              color: Colors.white,
                              fontSize: 20),
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.03,
                    ),
                    RichTextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushReplacementNamed(SignupScreen.routeName);
                      },
                      normalText: "Don\'t have an account?",
                      highlightedText: '  Sign up',
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.05,
                    ),
                    DividerWithText(
                      text: "OR",
                    ),
                    SizedBox(
                      height: deviceSize.height * 0.04,
                    ),
                    SocialMediaButtons(
                      state: CurrentState.Signin,
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: RichTextButton(
                        onPressed: () {},
                        normalText: "T&C'S apply.",
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
