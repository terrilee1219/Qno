//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qnoclient/screens/hamburger_container_screen.dart';
import '../providers/auth.dart';

//Constants Imports
import '../constants/theme_colors.dart';

//Widget Imports
import '../widgets/signup_form.dart';
import '../widgets/divider_with_center_text.dart';
import '../widgets/rich_text_button.dart';
import '../widgets/social_media_buttons.dart';
import '../widgets/loading_display.dart';

//modal Imports
import '../modals/User.dart';

//Screen Imports
import './signin_screen.dart';
import './home_screen.dart';

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
  bool _isLoading = false;

  void signUp() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState.save();
      try {
        await Provider.of<AuthService>(context, listen: false)
            .signUpWithEmail(_user.email, _user.password)
            .then((value) {
          setState(() {
            _isLoading = false;
          });
          Navigator.of(context)
              .pushReplacementNamed(HamburgerContainerScreen.routeName);
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
            ? LoadingDisplay(AuthType.signUp)
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
                        "Sign up",
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
                      SizedBox(height: deviceSize.height * 0.06),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: SignupForm(
                            formKey: _formKey, user: _user, onSubmit: signUp),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.03,
                      ),
                      Container(
                        width: double.infinity,
                        height: deviceSize.height * 0.06,
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: FlatButton(
                          onPressed: () => signUp(),
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                                fontFamily: "Numans",
                                color: Colors.white,
                                fontSize: 20),
                          ),
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.02,
                      ),
                      RichTextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(SignInScreen.routeName);
                        },
                        normalText: "Already have an account?",
                        highlightedText: '  Sign in',
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.04,
                      ),
                      DividerWithText(
                        text: "OR",
                      ),
                      SizedBox(
                        height: deviceSize.height * 0.04,
                      ),
                      SocialMediaButtons(
                        state: CurrentState.Signup,
                      ),
                      Expanded(
                        child: SizedBox(),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8),
                        child: RichTextButton(
                          onPressed: () {},
                          normalText: "T&C'S apply.",
                        ),
                      ),
                    ],
                  ),
                ),
              ));
  }
}
