import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  
  const AuthTextField({
    super.key,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText
      ),
    );
  }
}