import 'package:flutter/material.dart';

class ListItem {

  int orderID;
  int cellNumber;
  String name;

  ListItem({this.orderID,this.cellNumber,this.name});

  Dismissible createEntry(BuildContext context){
    /*return Dismissible(
      key: Key(waitingPatients[index]),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        setState(() {
          waitingPatients.removeAt(index);
        });
        Scaffold.of(context).showSnackBar(SnackBar(content: Text('SMS Sent To Patient')));
      },
      background: Container(color: Theme.of(context).primaryColor),
      child: ListTile(
        title: Container(
          height: 60,
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: ThemeColors.lightGrey,
              borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('OrderID: 1',style: Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).primaryColor),),
                Text('${waitingPatients[index]}',style: Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).primaryColor),)
              ],
            ),
          ),
        ),
      ),
    );*/
  }

}