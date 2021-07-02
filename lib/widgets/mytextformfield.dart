import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final Function validator;
  final String name;

  MyTextFormField({this.name, this.validator});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: name,
      ),
    );
  }
}
