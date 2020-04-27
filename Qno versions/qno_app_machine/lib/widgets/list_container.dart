//Imports
import 'package:flutter/material.dart';
import '../constants/theme_colors.dart';
import '../constants/theme_colors.dart';
import '../constants/theme_colors.dart';
import '../widgets/list_item.dart';

//Constants
import '../constants/theme_colors.dart';

class ListContainer extends StatefulWidget {
  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  List<String> waitingPatients = ['James', "Kerri", "Jack", "Jill"];

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: waitingPatients.length,
              itemBuilder: (BuildContext context,int index) {
                return Dismissible(
                  key: Key(waitingPatients[index]),
                  direction: DismissDirection.startToEnd,
                  onDismissed: (direction){
                    setState(() {
                      waitingPatients.removeAt(index);
                      print(index);
                    });
                    Scaffold.of(context).showSnackBar(SnackBar(content: Text('SMS Sent To Patient')));
                  },
                  background: Container(color: Theme.of(context).primaryColor,
                    child: Row(
                      children: [
                        Icon(
                            Icons.arrow_forward_ios,
                            color: ThemeColors.lightGrey,
                          size: 24.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              'Swipe To Call Patient',
                              style: Theme.of(context).textTheme.headline5.copyWith(color: ThemeColors.lightGrey)
                          ),
                        ),
                      ],
                    )
                  ),
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
                );
              },
      ),
    );
  }
}
