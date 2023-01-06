import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String title;
  
  Question(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}