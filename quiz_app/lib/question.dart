import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String title;
  
  Question(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(15),
      child: Text(
        title, 
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}