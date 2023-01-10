import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      if (_questionIndex == 2) {
        _questionIndex = -1;
      }
      _questionIndex++;
    });

    print('answer a question! at index $_questionIndex');
  }
  
  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Blue', 'Green', 'Red']
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Dog', 'Cat', 'Pig']
      },
      {
        'questionText': 'What\'s your favorite fruit?',
        'answers': ['Banana', 'Mango', 'Lychee', 'Orange']
      }
    ];

    final curAnswer = questions[_questionIndex]['answers'] as List<String>;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'].toString()
            ),
            ...(curAnswer.map((answerText) => Answer(answerText, _answerQuestion)).toList())
          ],
        ),
      ),
    );
  }
}