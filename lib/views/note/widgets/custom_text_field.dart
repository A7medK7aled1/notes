import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, required this.fontSize, required this.hintText});

  final double fontSize;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
