import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:machine/constants/theme_colors.dart';

class PhoneNumberInputField extends StatelessWidget {
  final double width;
  List<String> currentNumber;

  PhoneNumberInputField({this.width, this.currentNumber});

  String getStringAtIndex(int index){
    if(currentNumber[index] == ""){
      return "_";
    }
    else{
      return currentNumber[index];
    }
  }

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    var size = MediaQuery.of(context).size;
    const double _spaceBetweenNumberSections = 22.0;
    const double _spaceBetweenNumbers = 3;

    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("+27", style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumberSections,),
          Text(getStringAtIndex(0), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(1), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumberSections,),
          Text(getStringAtIndex(2), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(3), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(4), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumberSections,),
          Text(getStringAtIndex(5), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(6), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(7), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(8), style: Theme.of(context).textTheme.headline4.copyWith(color: Theme.of(context).primaryColor),),
        ],
      ),
    );
  }
}
