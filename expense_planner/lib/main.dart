import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/transaction.dart';
import 'widgets/chart.dart';
import 'widgets/transactions/transaction_list.dart';
import 'widgets/transactions/create_transaction.dart';


void main() {

  // // Define rendering behavior
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown
  // ]);

  runApp(MyApp());
}

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

  List<Transaction> _transactions = [
    // Transaction(id: 'tx001', title: 'Buy coffee', amount: 2.0, date: DateTime(2023,1,1)),
    // Transaction(id: 'tx001', title: 'Buy snack', amount: 2.5, date: DateTime(2023,1,5)),
    // Transaction(id: 'tx001', title: 'Buy bread', amount: 12.0, date: DateTime(2023,1,11)),
    // Transaction(id: 'tx001', title: 'Buy tea', amount: 7.0, date: DateTime(2023,1,12)),
    // Transaction(id: 'tx001', title: 'Buy rice', amount: 8.0, date: DateTime(2023,1,13)),
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

  void _deleteTransaction(String transactionId) {
    setState(() {
      _transactions.removeWhere((tran) => tran.id == transactionId);
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

  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7), 
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text('Expense Planner'),
      actions: <Widget>[
        IconButton(
          onPressed: () => _showCreateTransactionForm(context), 
          icon: Icon(
            Icons.add
          ),
        ),
      ],
    );

    final calRemainingHeight = MediaQuery.of(context).size.height  - appBar.preferredSize.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      appBar: appBar,
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
            height: calRemainingHeight * 0.3,
            width: double.infinity,
            child: Chart(_recentTransactions),
          ),
          Container(
            height: calRemainingHeight * 0.7,
            child: TransactionList(transactions: _transactions, deleteTransactionHandler: _deleteTransaction)
          ),
        ],
      ),
    );
  }
}