import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {

  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      if (questionIndex == 2) {
        questionIndex = -1;
      }
      questionIndex++;
    });

    print('answer a question! at index $questionIndex');
  }
  
  @override
  Widget build(BuildContext context) {

    var questions = [
      'What\'s your favorite color?',
      'What\'s your favorite animal?',
      'What\'s your favorite fruit?',
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Column(children: [
          Text(questions.elementAt(questionIndex)),
          ElevatedButton(
            onPressed: answerQuestion, 
            child: const Text('Answer 1'),
          ),
          ElevatedButton(
            onPressed: answerQuestion, 
            child: const Text('Answer 2'),
          ),
          ElevatedButton(
            onPressed: answerQuestion, 
            child: const Text('Answer 3'),
          ),
        ],),
      ),
    );
  }
}