import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/signup.dart';
import 'package:flutter_ecommerce/widgets/changescreen.dart';
import 'package:flutter_ecommerce/widgets/mybutton.dart';
import 'package:flutter_ecommerce/widgets/mytextformfield.dart';
import 'package:flutter_ecommerce/widgets/passwordtextformfield.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
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

class _LoginState extends State<Login> {
  Widget _buildAllPart() {
    return Container(
      height: 330,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Login",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          SizedBox(
            height: 20,
          ),

          // MyTextFormField
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

          // PasswordTextFormField
          PasswordTextFormField(
            obserText: obserText,
            name: "Password",
            validator: (value) {
              if (value == "") {
                return "Please Fill Password";
              } else if (value.length < 8) {
                return "Password Is Too Short";
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

          // MyButton
          MyButton(
            name: "Login",
            onPressed: () {
              validation();
            },
          ),

          // changescreen
          ChangeScreen(
            name: "SignUp",
            whichAccount: "I Have Not Account!",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => SignUp(),
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
      body: Form(
        key: _formKey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildAllPart(),
            ],
          ),
        ),
      ),
    );
  }
}
