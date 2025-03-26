import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.fontSize,
      required this.hintText,
      this.validator,
      this.onSaved});

  final double fontSize;
  final String hintText;

  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextFormField(
        maxLines: null,
        keyboardType: TextInputType.multiline,
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return 'This field is required';
          }
          return null;
        },
        style: TextStyle(fontSize: fontSize),
        decoration: InputDecoration(
          border: InputBorder.none,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          hintText: hintText,
          hintStyle: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}
