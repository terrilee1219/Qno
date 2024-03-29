//Imports
//Package Imports
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qnoclient/screens/signin_screen.dart';

//Constants Imports
import '../constants/theme_colors.dart';

//Provider Imports
import '../providers/auth.dart';

//Screen Imports
import '../screens/home_screen.dart';
import '../screens/how_to_screen.dart';

class HamburgerContainerScreen extends StatefulWidget {
  static const String routeName = "/hamburger-container";

  @override
  _HamburgerContainerScreenState createState() =>
      _HamburgerContainerScreenState();
}

class _HamburgerContainerScreenState extends State<HamburgerContainerScreen> {
  //Class States
  Screen _currentScreen = Screen.home;

  Widget _pageBuilder() {
    switch (_currentScreen) {
      case Screen.home:
        return HomeScreen();
        break;
      case Screen.howTo:
        return HowToScreen();
        break;
      case Screen.forgotPassword:
        return null;
        break;
      case Screen.logout:
        return null;
        break;
    }
  }

  Widget _listTileBuilder(
      String text, IconData icon, Function onTap, Screen screen) {
    return Container(
      color: (screen != _currentScreen)
          ? Theme.of(context).scaffoldBackgroundColor
          : ThemeColors.lightGrey.withOpacity(0.04),
      child: ListTile(
        onTap: () {
          onTap();
          Navigator.of(context).pop();
        },
        title: Text(
          text,
          style: Theme.of(context).textTheme.headline.copyWith(
              fontSize: 16,
              color: ThemeColors.lightGrey.withOpacity(0.8),
              fontFamily: 'Lato'),
        ),
        leading: Icon(icon),
      ),
    );
  }

  void onListTileClicked(Screen screen) {
    if (screen != Screen.logout && screen != Screen.forgotPassword) {
      setState(() {
        _currentScreen = screen;
      });
    }
  }

  String _getScreenTitle() {
    switch (_currentScreen) {
      case Screen.home:
        return "Home";
        break;
      case Screen.howTo:
        return "How to use Qno";
        break;
      case Screen.forgotPassword:
        return "Forgot your password?";
        break;
      case Screen.logout:
        return "Sign out";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        textTheme: Theme.of(context).textTheme.copyWith(
            headline:
                TextStyle(color: ThemeColors.purpleSwatch, fontSize: 20)),
        centerTitle: true,
        iconTheme: IconThemeData(
          color: ThemeColors.purpleSwatch,
        ),
        title: Text(_getScreenTitle()),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                color: ThemeColors.purpleSwatch.withOpacity(0.9),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hello!",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: Colors.white),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Have a great day.",
                      style: Theme.of(context)
                          .textTheme
                          .headline
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            _listTileBuilder("Home", Icons.home,
                () => onListTileClicked(Screen.home), Screen.home),
            Divider(),
            _listTileBuilder("How to use Qno", Icons.help,
                () => onListTileClicked(Screen.howTo), Screen.howTo),
            Expanded(
              child: Container(),
            ),
            Divider(),
            _listTileBuilder("Logout", Icons.exit_to_app, () {
              Future.delayed(Duration.zero, () {
                AlertDialog alert = AlertDialog(
                  title: Text("Are you sure?"),
                  content: Text("You are about to logout."),
                  actions: [
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    FlatButton(
                      onPressed: () {
                        Provider.of<AuthService>(context, listen: false)
                            .signOut();
                        Navigator.pop(context);
                        Navigator.of(context)
                            .pushReplacementNamed(SignInScreen.routeName);
                      },
                      child: Text("Confirm"),
                    ),
                  ],
                );
                showDialog(
                    context: context,
                    builder: (_) {
                      return alert;
                    });
              });
            }, Screen.logout)
          ],
        ),
      ),
      body: _pageBuilder(),
    );
  }
}

enum Screen {
  home,
  howTo,
  forgotPassword,
  logout,
}
