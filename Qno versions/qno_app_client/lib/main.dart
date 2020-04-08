/// Qno is a smart coaster paging app designed with flutter.
/// This is Qno v0.1 and is a basic proof of concept which has no sophisticated communication between client and nfc.

//Package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//Constants
import './constants/theme_colors.dart';

//Screens
import './screens/signin_screen.dart';
import './screens/signup_screen.dart';
import './screens/splash_screen.dart';
import './screens/hamburger_container_screen.dart';
import './screens/onboard_slides_screen.dart';
import './screens/forgot_password_screen.dart';

//Providers
import 'providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    AuthService _auth = AuthService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: _auth,
        ),
      ],
      child: MaterialApp(
        title: "Qno",
        theme: ThemeData(
          primarySwatch: ThemeColors.purpleSwatch,
        ),
        home:
        (_auth.loggedIn)
            ? HamburgerContainerScreen()
            : FutureBuilder(
                future: _auth.tryAutoLogin(),
                builder: (ctx, authResult) =>
                    authResult.connectionState == ConnectionState.waiting
                        ? SplashScreen()
                        : (_auth.loggedIn) ? HamburgerContainerScreen() : OnboardScreen(),
              ),
        routes: {
          HamburgerContainerScreen.routeName: (ctx) => HamburgerContainerScreen(),
          SignInScreen.routeName: (ctx) => SignInScreen(),
          SignupScreen.routeName: (ctx) => SignupScreen(),
          OnboardScreen.routeName: (ctx) => OnboardScreen(),
          ForgotPasswordScreen.routeName: (ctx) => ForgotPasswordScreen()
        },
      ),
    );
  }
}
