//Imports
import 'package:flutter/material.dart';
import 'package:machine/models/order.dart';
import 'package:machine/providers/orders.dart';
import 'package:provider/provider.dart';
import '../constants/theme_colors.dart';
import '../constants/theme_colors.dart';
import '../constants/theme_colors.dart';
import '../widgets/list_item.dart';
import '../providers/orders.dart';

//Constants
import '../constants/theme_colors.dart';

class ListContainer extends StatefulWidget {
  final List<Order> orders;

  ListContainer({@required this.orders});

  @override
  _ListContainerState createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: widget.orders.length,
      itemBuilder: (BuildContext context, int index) {
        return Dismissible(
          key: Key(widget.orders[index].orderId.toString()),
          direction: DismissDirection.startToEnd,
          onDismissed: (direction) {
            Provider.of<Orders>(context, listen: false).writeUserData(widget.orders[index].phoneNumber.toString());
            setState(() {
              Provider.of<Orders>(context, listen: false).deleteOrder(index);
              print(index);
            });
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('SMS Sent To Patient')));
          },
          background: Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: ThemeColors.lightGrey,
                    size: 24.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Swipe To Notify Patient',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: ThemeColors.lightGrey)),
                  ),
                ],
              )),
          child: ListTile(
            title: Container(
              height: 60,
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: ThemeColors.lightGrey,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'OrderID: ${widget.orders[index].orderId.toString()}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      '${widget.orders[index].phoneNumber}',
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(color: Theme.of(context).primaryColor),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
