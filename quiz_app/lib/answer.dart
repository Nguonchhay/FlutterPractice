import 'package:flutter/material.dart';

class Answer extends StatelessWidget {

  final String answer;
  final VoidCallback answerHandler;

  const Answer(this.answer, this.answerHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        left: 15,
        right: 15
      ),
      child: ElevatedButton(
        onPressed: answerHandler, 
        child: Text(
          answer, 
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}