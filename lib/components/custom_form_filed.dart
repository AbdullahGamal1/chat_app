import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String? hintText;
  Function(String)? onChange;

  CustomFormField({this.hintText,this.onChange});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
        decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(40),
      ),
    ));
  }
}
