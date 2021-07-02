import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function onPressed;
  final String name;

  MyButton({this.name, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      // ignore: deprecated_member_use
      child: RaisedButton(
        elevation: 5,
        onPressed: onPressed,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        color: Colors.lightBlue,
      ),
    );
  }
}
