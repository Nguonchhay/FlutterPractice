import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int selectedIndex;
  final VoidCallback answerHandler;

  const Quiz({
    super.key, 
    required this.questions, 
    required this.selectedIndex, 
    required this.answerHandler
  });

  @override
  Widget build(BuildContext context) {
    return 
      Column(
        children: [
          Question(
            questions[selectedIndex]['questionText'] as String
          ),
          ...(
              (questions[selectedIndex]['answers'] as List<String>)
              .map((answerText) => Answer(answerText, answerHandler)
          )
          .toList()),
        ],
      );
  }
}