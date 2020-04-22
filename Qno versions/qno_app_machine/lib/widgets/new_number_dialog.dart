//Imports
import 'package:flutter/material.dart';
import '../widgets/phone_number_input_field.dart';

class NewNumberDialog extends StatefulWidget {
  @override
  _NewNumberDialogState createState() => _NewNumberDialogState();
}

class _NewNumberDialogState extends State<NewNumberDialog> {
  //Class States
  List<String> _currentNumber = ["+27", "","", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    //Runtime variables
    var size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0)
      ),
      child: Container(
        width: size.width * 0.67,
        height: size.height * 0.58,
        //color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.015,),
            Text("New Order", style: Theme.of(context).textTheme.headline5.copyWith(color: Theme.of(context).primaryColor),),
            SizedBox(height: size.height * 0.03,),
            PhoneNumberInputField()
          ],
        ),
      ),
    );
  }
}
