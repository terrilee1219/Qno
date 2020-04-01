//Imports
import 'package:flutter/material.dart';
import 'package:qnoclient/constants/theme_colors.dart';
import '../Modals/User.dart';

class SigninForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final User user;
  final Function onSubmit;
  SigninForm({@required this.formKey, this.user,@required this.onSubmit});

  @override
  _SigninFormState createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  FocusNode _passwordFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    //In app variables
    var deviceSize = MediaQuery.of(context).size;

    var inputFieldDecoration = const InputDecoration(
      border: OutlineInputBorder(borderSide: BorderSide(color: ThemeColors.purpleSwatch, width: 1)),
      hintStyle: TextStyle(fontFamily: "Lato", fontSize: 14, color: Colors.grey),
      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ThemeColors.purpleSwatch, width: 1)),
      contentPadding: EdgeInsets.all(10),
    );

    return Form(
      key: widget.formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "Please enter an email address.";
              }
              if(!value.contains("@") || !value.contains(".")){
                return "Please enter a valid email address.";
              }
              return null;
            },
            decoration: inputFieldDecoration.copyWith(
              hintText: "Email Address"
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _passwordFocusNode.requestFocus(),
            onSaved: (value){
              widget.user.email = value.trim();
            },
          ),
          SizedBox(height: deviceSize.height * 0.03,),
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "Please enter a password.";
              }
              return null;
            },
            focusNode: _passwordFocusNode,
            decoration: inputFieldDecoration.copyWith(
                hintText: "Password"
            ),
            onSaved: (value){
              widget.user.password = value.trim();
            },
            onFieldSubmitted: (_) => widget.onSubmit(),
          ),
        ],
      ),
    );

  }
}
