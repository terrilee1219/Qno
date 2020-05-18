import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    ScreenUtil.init(context, width: 834, height: 1194, allowFontScaling: true);
    double _spaceBetweenNumberSections = 22.0.w;
    double _spaceBetweenNumbers = 3.w;
    TextStyle style = Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).primaryColor, fontSize: ScreenUtil().setSp(34, allowFontScalingSelf: true));


    return Container(
      width: width,
      height: 50.h,
      decoration: BoxDecoration(
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("+27", style: style,),
          SizedBox(width: _spaceBetweenNumberSections,),
          Text(getStringAtIndex(0), style: style,),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(1), style: style,),
          SizedBox(width: _spaceBetweenNumberSections,),
          Text(getStringAtIndex(2), style: style,),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(3), style: style,),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(4), style: style,),
          SizedBox(width: _spaceBetweenNumberSections,),
          Text(getStringAtIndex(5), style: style,),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(6), style: style,),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(7), style: style,),
          SizedBox(width: _spaceBetweenNumbers,),
          Text(getStringAtIndex(8), style: style,),
        ],
      ),
    );
  }
}
