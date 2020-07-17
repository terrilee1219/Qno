import 'package:flutter/material.dart';

void main() {
  runApp(QnoOrders());
}

class QnoOrders extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return OrderState();
  }
}

class OrderState extends State<QnoOrders> {
  List<String> orderList = List();
  String temp;
  int orderNum = 0;
  @override

  removeOrder(index){
    setState(() {
      orderList.removeAt(index);
    });
  }

  showSnackBar(context,order) {
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 1),
      content: Text('Order $order completed'),
    ));
  }
  Widget list() {
    return ListView.builder(
      padding: EdgeInsets.all(20.0),
      itemCount: orderList.length,
      itemBuilder: (BuildContext context, int index) {
        return row(context, index);
      },
    );
  }

  Widget row(context, index) {
    return Dismissible(
      key: Key(orderList[index]),
      onDismissed: (direction) {
        var order = orderList[index];
        showSnackBar(context, order);
        removeOrder(index);
      },
      child: Card(
        child: ListTile(
          title: Text(orderList[index]),
        )
      )
    );
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Order numbers'),
        centerTitle: true,
        ),
      body: Container(
        child: list(),
      ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(height: 50.0,),
        ),
    floatingActionButton: FloatingActionButton(
      onPressed: () => setState(() {
      orderNum = orderNum + 1;
      String temp = orderNum.toString();
      //Here we would want to associate this ID with the phone that was tapped.
      //Then when the column is swiped, the ID is forgotten
      orderList.add(temp);
    }),
      child: Icon(Icons.add),
      ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }
}