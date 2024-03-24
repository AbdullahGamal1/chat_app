import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  String? hintText;
  Function(String)? onChange;
  TextInputType? keyboardType = TextInputType.text;
  bool isPassword;

  CustomFormField(
      {super.key,
      this.hintText,
      this.onChange,
      this.keyboardType,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: (value) {
          if (value!.isEmpty) {
            return 'field is required';
          }
        },
        obscureText: isPassword,
        onChanged: onChange,
        keyboardType: keyboardType,
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
