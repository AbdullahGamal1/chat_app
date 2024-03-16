import 'package:flutter/material.dart';

class CustomBottom extends StatelessWidget {
  CustomBottom({required this.text, this.onTap});

  String? text;
  Function? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            '$text',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ))),
    );
  }
}
