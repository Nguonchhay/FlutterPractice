import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      home: MyHomeScreen()
    );
  }
}

class MyHomeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner')
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Container (
              width: double.infinity,
              child: Text('CHART!'),
            ),
            elevation: 5,
          ),
          Card(
            child: Text('LIST OF TX')
          ),
        ],
      ),
    );
  }
}