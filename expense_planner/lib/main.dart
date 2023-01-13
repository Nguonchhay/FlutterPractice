import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/transactions/transaction-item.dart';

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

  final List<Transaction> transations = [
    Transaction(id: 'tx001', title: 'Buy coffee', amount: 2.0, date: DateTime(2023,1,1)),
    Transaction(id: 'tx001', title: 'Buy snack', amount: 2.5, date: DateTime(2023,1,5)),
    Transaction(id: 'tx001', title: 'Buy bread', amount: 12.0, date: DateTime(2023,1,11)),
    Transaction(id: 'tx001', title: 'Buy tea', amount: 7.0, date: DateTime(2023,1,12)),
    Transaction(id: 'tx001', title: 'Buy rice', amount: 8.0, date: DateTime(2023,1,13))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner')
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              child: Text('CHART!'),
              elevation: 5,
            ),
          ),
          Column(
           children: transations.map((tran) {
              return TransactionItem(transaction: tran);
            }).toList(),
           ),
        ],
      ),
    );
  }
}