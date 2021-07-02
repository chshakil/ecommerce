import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/login.dart';
import 'package:flutter_ecommerce/widgets/changescreen.dart';
import 'package:flutter_ecommerce/widgets/mybutton.dart';
import 'package:flutter_ecommerce/widgets/mytextformfield.dart';
import 'package:flutter_ecommerce/widgets/passwordtextformfield.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

RegExp regExp = new RegExp(p);
bool obserText = true;

void validation() {
  final FormState _form = _formKey.currentState;
  if (_form.validate()) {
    print("Yes");
  } else {
    print("No");
  }
}

class _SignUpState extends State<SignUp> {
  Widget _buildAllTextFormField() {
    return Container(
      height: 330,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          //MyTextFormField
          MyTextFormField(
            name: "UserName",
            validator: (value) {
              if (value == "") {
                return "Please Fill UserName";
              } else if (value.length < 6) {
                return "UserName Is Too Short";
              }
              return "";
            },
          ),

          //MyTextFormField
          MyTextFormField(
            name: "Email",
            validator: (value) {
              if (value == "") {
                return "Please Fill Email";
              } else if (!regExp.hasMatch(value)) {
                return "Email Is Invalid";
              }
              return "";
            },
          ),

          //PasswordTextFormField
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            validator: (value) {
              if (value == "") {
                return "Please Fill Password";
              } else if (value.length < 8) {
                return "Password Is Invalid";
              }
              return "";
            },
            onTap: () {
              FocusScope.of(context).unfocus();
              setState(() {
                obserText = !obserText;
              });
            },
          ),

          //MyTextFormField
          MyTextFormField(
            name: "Phone Number",
            validator: (value) {
              if (value == "") {
                return "Please Fill Phone Number";
              } else if (value.length < 11) {
                return "Phone Number Is Too Short";
              }
              return "";
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Container(
      height: 400,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildAllTextFormField(),
          MyButton(
            name: "SignUp",
            onPressed: () {
              validation();
            },
          ),

          // changescreen
          ChangeScreen(
            name: "Login",
            whichAccount: "I Have Already An Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => Login(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildBottomPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
