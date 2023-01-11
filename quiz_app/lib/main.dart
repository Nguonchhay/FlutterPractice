import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {

  var _questionIndex = 0;
  final _questions = [
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

  void _answerQuestion() {
    setState(() {  
      _questionIndex++;
    });

    print('answer a question! at index $_questionIndex');
  }
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length ? Quiz(
          questions: _questions, 
          selectedIndex:_questionIndex, 
          answerHandler: _answerQuestion
          ) : const Result(), 
      ),
    );
  }
}