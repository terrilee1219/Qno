//Imports
//Packages
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Widgets
import '../widgets/new_number_dialog.dart';
import '../widgets/list_container.dart';

//Providers
import '../providers/orders.dart';

class HomeScreen extends StatelessWidget {
  //Class Variables
  static const String routeName = "/";

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Orders",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(color: Theme.of(context).primaryColor)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Container(
          child: (Provider.of<Orders>(context).orders.isNotEmpty)
              ? ListContainer(
                  orders: Provider.of<Orders>(context).orders,
                )
              : Center(
                  child: Text(
                    "There is currently no one in queue",
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (ctx) => NewNumberDialog());
        },
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
