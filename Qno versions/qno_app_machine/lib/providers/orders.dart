//Imports
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart';
import '../models/order.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Orders with ChangeNotifier{
  //Orders Variables
  List<Order> orders = [];
  int currOrderNum = 0;

  void addNewOrder(String phoneNumber){
    //TODO: Add new order to the server
    orders.add(Order(getNewOrderNumber(), phoneNumber));
    notifyListeners();
  }

  int getNewOrderNumber(){
    //TODO: Reset the order count each new day.
    return ++currOrderNum;
  }

  void deleteOrder(int index){
    orders.removeAt(index);
    notifyListeners();
  }

  void  writeUserData (String phoneNo) async {
    var now = new DateTime.now();
    dynamic dateTime = new DateFormat("dd-MM-yyyy hh:mm:ss").format(now);


    //Call for web application cloud functions
    final db = Firestore.instance;
    db.collection("requests").document().setData({"phoneNo": phoneNo, "subDate" : dateTime});
  }

}