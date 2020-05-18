//Imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Numpad extends StatelessWidget {
  //Class Variables
  Function onKeyPressed;
  static const double horizontalSpaceBetweenButtons = 40;

  Numpad({@required this.onKeyPressed});

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    ScreenUtil.init(context, width: 834, height: 1194, allowFontScaling: true);
    double gapBetweenKeys = 40.w;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.One,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Two,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Three,
              ),
            ],
          ),
          SizedBox(
            height: gapBetweenKeys,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Four,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Five,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Six,
              ),
            ],
          ),
          SizedBox(
            height: gapBetweenKeys,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Seven,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Eight,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Nine,
              ),
            ],
          ),
          SizedBox(
            height: gapBetweenKeys,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 70.w,
                width: 70.w,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Zero,
              ),
              SizedBox(
                width: gapBetweenKeys,
              ),
              NumpadKey(
                onKeyTap: onKeyPressed,
                keyType: NumpadKeyType.Backspace,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NumpadKey extends StatelessWidget {
  final NumpadKeyType keyType;
  final Function onKeyTap;

  NumpadKey({this.keyType, this.onKeyTap});

  static numpadKeyTypeToString(NumpadKeyType keyType) {
    switch (keyType) {
      case NumpadKeyType.Zero:
        return "0";
        break;
      case NumpadKeyType.One:
        return "1";
        break;
      case NumpadKeyType.Two:
        return "2";
        break;
      case NumpadKeyType.Three:
        return "3";
        break;
      case NumpadKeyType.Four:
        return "4";
        break;
      case NumpadKeyType.Five:
        return "5";
        break;
      case NumpadKeyType.Six:
        return "6";
        break;
      case NumpadKeyType.Seven:
        return "7";
        break;
      case NumpadKeyType.Eight:
        return "8";
        break;
      case NumpadKeyType.Nine:
        return "9";
        break;
      case NumpadKeyType.Backspace:
        return "asset path";
        break;
      default:
        return "N/A";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    //Runtime Variables
    ScreenUtil.init(context, width: 834, height: 1194, allowFontScaling: true);

    return GestureDetector(
      onTap: () {
        onKeyTap(this.keyType);
      },
      child: Container(
        height: 70.w,
        width: 70.w,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(10.w),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 4,
                  offset: Offset(0, 4))
            ]),
        child: Center(
          child: (keyType == NumpadKeyType.Backspace)
              ? Icon(
                  Icons.backspace,
                  color: Colors.white,
                  size: 25.w,
                )
              : FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    numpadKeyTypeToString(keyType),
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white,
                        fontSize:
                            ScreenUtil().setSp(34, allowFontScalingSelf: true)),
                  ),
                ),
        ),
      ),
    );
  }
}

enum NumpadKeyType {
  One,
  Two,
  Three,
  Four,
  Five,
  Six,
  Seven,
  Eight,
  Nine,
  Zero,
  Backspace
}
