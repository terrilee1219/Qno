//Imports
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:machine/providers/orders.dart';
import 'package:provider/provider.dart';
import '../widgets/phone_number_input_field.dart';
import '../widgets/numpad.dart';

class NewNumberDialog extends StatefulWidget {
  @override
  _NewNumberDialogState createState() => _NewNumberDialogState();
}

class _NewNumberDialogState extends State<NewNumberDialog> {
  //Class States
  List<String> _currentNumber = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  int _currentNumberIndex = 0;
  String _errorText = "";

  bool validateInput() {
    if (_currentNumberIndex == 0) {
      setState(() {
        _errorText = "The number cannot be left blank.";
      });
      return false;
    } else if (_currentNumberIndex != 9) {
      setState(() {
        _errorText = "Please enter a valid number.";
      });
      return false;
    } else {
      return true;
    }
  }

  void numpadKeyPressed(NumpadKeyType type) {
    if (type == NumpadKeyType.Backspace) {
      //Can't go any more back if you are on the last digit.
      if (_currentNumberIndex == 0) {
        setState(() {
          _currentNumber[_currentNumberIndex] = "";
        });
      }
      //If they try and delete after reaching the end.
      else if (_currentNumberIndex > 8) {
        setState(() {
          _currentNumberIndex = 8;
          _currentNumber[_currentNumberIndex] = "";
        });
        //If they delete normally
      } else {
        setState(() {
          _currentNumber[_currentNumberIndex] = "";
          _currentNumberIndex -= 1;
        });
      }
    } else {
      if (_currentNumberIndex <= 8) {
        setState(() {
          _currentNumber[_currentNumberIndex] =
              NumpadKey.numpadKeyTypeToString(type);
          _currentNumberIndex += 1;
        });
      }
    }
  }

  String get phoneNumber {
    String number = "+27 ";
    for (int i = 0; i < _currentNumber.length; i++) {
      //Add a space to the string
      if (i == 2 || i == 5) {
        number += " ";
      }

      number += _currentNumber[i];
    }

    return number;
  }

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    ScreenUtil.init(context, width: 834, height: 1194, allowFontScaling: true);

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        width: 557.w,
        height: 700.h,
        //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 15.h,
            ),
            Text(
              "New Order",
              style: Theme.of(context).textTheme.headline5.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontSize: ScreenUtil().setSp(24, allowFontScalingSelf: true)),
            ),
            SizedBox(
              height: 30.h,
            ),
            PhoneNumberInputField(
              width: 482.w,
              currentNumber: _currentNumber,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              _errorText,
              style: Theme.of(context).textTheme.headline6.copyWith(
                  color: Colors.red,
                  fontSize: ScreenUtil().setSp(20, allowFontScalingSelf: true)),
            ),
            SizedBox(
              height: 45.h,
            ),
            Numpad(
              onKeyPressed: numpadKeyPressed,
            ),
            SizedBox(
              height: 60.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      width: 175.w,
                      height: 45.h,
                      child: Center(
                          child: Text(
                        "Cancel",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(34, allowFontScalingSelf: true)),
                      )),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      width: 175.w,
                      height: 45.h,
                      child: Center(
                          child: Text(
                        "Confirm",
                        style: Theme.of(context).textTheme.headline5.copyWith(
                            color: Colors.white,
                            fontSize: ScreenUtil()
                                .setSp(34, allowFontScalingSelf: true)),
                      )),
                    ),
                    onPressed: () {
                      if (validateInput()) {
                        //If valid add to orders
                        Provider.of<Orders>(context, listen: false)
                            .addNewOrder(phoneNumber);
                        Navigator.of(context).pop();
                      }
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
