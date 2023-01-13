import 'package:flutter/material.dart';

import 'widgets/transactions/user_transaction.dart';


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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          UserTransaction(),
        ],
      ),
    );
  }
}