class Order{
  //Order Variables
  int _orderId;
  String _phoneNumber;

  Order(int orderId, String phoneNumber){
    this._orderId = orderId;
    this._phoneNumber = phoneNumber;
  }

  int get orderId{
    return _orderId;
  }

  String get phoneNumber{
    return _phoneNumber;
  }
}