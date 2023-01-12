import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;

  Result(this.totalScore, {super.key});

  String get resultPhrase {
    var resultText = 'You did it!';
    if (totalScore <= 20) {
      resultText = 'You are awesome and innocent';
    } else if (totalScore <= 25) {
      resultText = 'Pretty likable';
    } else if (totalScore <= 30) {
      resultText = 'You are so .... strange!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        resultPhrase,
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}