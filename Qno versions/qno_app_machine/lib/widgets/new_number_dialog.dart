//Imports
import 'package:flutter/material.dart';
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
    if (_currentNumberIndex == 0){
      setState(() {
        _errorText = "The number cannot be left blank.";
      });
      return false;
    }
    else if (_currentNumberIndex != 9) {
      setState(() {
        _errorText = "Please enter a valid number.";
      });
      return false;
    }
    else{
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

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    var size = MediaQuery.of(context).size;

    double getDynamicWidth(double portraitFactor, double landscapeFactor) {
      return (MediaQuery.of(context).orientation == Orientation.landscape)
          ? size.width * landscapeFactor
          : size.width * portraitFactor;
    }

    double getDynamicHeight(double portraitFactor, double landscapeFactor) {
      return (MediaQuery.of(context).orientation == Orientation.landscape)
          ? size.height * landscapeFactor
          : size.height * portraitFactor;
    }

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      child: Container(
        width: getDynamicWidth(0.67, 0.48),
        height: getDynamicHeight(0.60, 0.82),
        //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.015,
            ),
            Text(
              "New Order",
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            PhoneNumberInputField(
              width: getDynamicWidth(0.58, 0.40),
              currentNumber: _currentNumber,
            ),
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              _errorText,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(color: Colors.red),
            ),
            SizedBox(
              height: getDynamicHeight(0.032, 0.045),
            ),
            Numpad(
              onKeyPressed: numpadKeyPressed,
            ),
            SizedBox(
              height: getDynamicHeight(0.05, 0.055),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                    child: Container(
                      width: getDynamicWidth(0.15, 0.15),
                      height: 45,
                      child: Center(
                          child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
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
                      width: getDynamicWidth(0.15, 0.15),
                      height: 45,
                      child: Center(
                          child: Text(
                        "Confirm",
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(color: Colors.white),
                      )),
                    ),
                    onPressed: () {
                      if(validateInput()){
                        print(_currentNumber);
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
