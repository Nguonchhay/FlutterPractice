import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/transactions/user_transaction.dart';
import 'widgets/transactions/create_transaction.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Planner',
      theme: ThemeData(
        primarySwatch: Colors.green,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.amber),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            titleMedium: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
            )
          ),
        ),
      ),
      home: MyHomeScreen()
    );
  }
}

class MyHomeScreen extends StatefulWidget {

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {

  final List<Transaction> _transactions = [
    // Transaction(id: 'tx001', title: 'Buy coffee', amount: 2.0, date: DateTime(2023,1,1)),
    // Transaction(id: 'tx001', title: 'Buy snack', amount: 2.5, date: DateTime(2023,1,5)),
    // Transaction(id: 'tx001', title: 'Buy bread', amount: 12.0, date: DateTime(2023,1,11)),
    // Transaction(id: 'tx001', title: 'Buy tea', amount: 7.0, date: DateTime(2023,1,12)),
    // Transaction(id: 'tx001', title: 'Buy rice', amount: 8.0, date: DateTime(2023,1,13))
  ];

  void _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }
  
  void _showCreateTransactionForm(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bctx) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: CreateTransaction(_addTransaction),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Planner'),
        actions: <Widget>[
          IconButton(
            onPressed: () => _showCreateTransactionForm(context), 
            icon: Icon(
              Icons.add
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showCreateTransactionForm(context),
        child: Text('+'),
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
          UserTransaction(_transactions),
        ],
      ),
    );
  }
}