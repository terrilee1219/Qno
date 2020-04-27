//Imports
import 'package:flutter/foundation.dart';
import '../models/order.dart';

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

}