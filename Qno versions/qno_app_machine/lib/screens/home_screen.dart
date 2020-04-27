//Imports
//Packages
import 'package:flutter/material.dart';
import '../widgets/list_container.dart';

//Widgets
import '../widgets/new_number_dialog.dart';

class HomeScreen extends StatelessWidget {
  //Class Variables
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: FlatButton(
                onPressed: (){
                  showDialog(context: context, builder: (context) => NewNumberDialog());
                },
                child: Text("Popup"),
              ),
            ),
            ListContainer(),
          ],
        ),
      ),
    );
  }
}
