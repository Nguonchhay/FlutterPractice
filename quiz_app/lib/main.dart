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
      'answers': [
        { 'text': 'Blue', 'score': 7 }, 
        { 'text': 'Green', 'score': 5 }, 
        { 'text': 'Red', 'score': 10 }
      ]
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        { 'text': 'Dog', 'score': 7 }, 
        { 'text': 'Cat', 'score': 5 }, 
        { 'text': 'Pig', 'score': 10 }
      ]
    },
    {
      'questionText': 'What\'s your favorite fruit?',
      'answers': [
        { 'text': 'Mango', 'score': 7 }, 
        { 'text': 'Lychee', 'score': 5 }, 
        { 'text': 'Banana', 'score': 10 },
        { 'text': 'Orange', 'score': 8 }
      ]
    }
  ];
  int _totalScore = 0;

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {  
      _questionIndex++;
    });

    print('answer a question! at index $_questionIndex');
  }

  void _restartQuiz() {
    setState(() {
      _totalScore = 0;
    _questionIndex = 0;
    });
  }
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length ? Quiz(
          questions: _questions, 
          selectedIndex:_questionIndex, 
          answerHandler: _answerQuestion
          ) : Result(_totalScore, _restartQuiz), 
      ),
    );
  }
}