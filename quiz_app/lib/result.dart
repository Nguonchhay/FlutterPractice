import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback onPressHandler;

  Result(this.totalScore, this.onPressHandler, {super.key});

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
    return  Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: onPressHandler,
          child: const Text('Restart Quiz'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              resultPhrase,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        )
      )
    );
  }
}