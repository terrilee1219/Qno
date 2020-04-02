//Imports
import 'package:flutter/material.dart';
import 'package:qnoclient/constants/theme_colors.dart';
import '../Modals/User.dart';

class SignupForm extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final User user;
  final Function onSubmit;

  SignupForm({@required this.formKey, this.user,@required this.onSubmit});

  @override
  _SignupFormState createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  FocusNode _emailFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _confirmPasswordFocusNode = FocusNode();

  TextEditingController _passwordController = TextEditingController();
  
  bool _isInit = true;

  @override
  void dispose() {
    //Dispose controllers and focus nodes to prevent a memory leak.
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if(_isInit){
      _passwordController.addListener(() { })
    }
    _isInit = false;
    super.didChangeDependencies();
  }
  
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
                return "Please enter your full name.";
              }
              if(!value.contains("@") || !value.contains(".") || !value.contains("-") || !value.contains("_")){
                return "Please enter a valid name.";
              }
              return null;
            },
            decoration: inputFieldDecoration.copyWith(
                hintText: "Full Name"
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _emailFocusNode.requestFocus(),
            onSaved: (value){
              widget.user.fullName = value.trim();
            },
          ),
          SizedBox(height: deviceSize.height * 0.03,),
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
            focusNode: _emailFocusNode,
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
            controller: _passwordController,
            onSaved: (value){
              widget.user.password = value.trim();
            },
            onFieldSubmitted: (_) => _confirmPasswordFocusNode.requestFocus(),
          ),
          SizedBox(height: deviceSize.height * 0.03,),
          TextFormField(
            validator: (value){
              if(value.isEmpty){
                return "Please enter a password.";
              }
              if(value != _passwordController.)
              return null;
            },
            focusNode: _confirmPasswordFocusNode,
            decoration: inputFieldDecoration.copyWith(
                hintText: "Confirm Password"
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