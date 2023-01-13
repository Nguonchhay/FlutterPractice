import 'package:expense_planner/widgets/transactions/transaction_list.dart';
import 'package:flutter/material.dart';

import '../../models/transaction.dart';
import 'create_transaction.dart';


class UserTransaction extends StatefulWidget {
  const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {

  final List<Transaction> _transactions = [
    Transaction(id: 'tx001', title: 'Buy coffee', amount: 2.0, date: DateTime(2023,1,1)),
    Transaction(id: 'tx001', title: 'Buy snack', amount: 2.5, date: DateTime(2023,1,5)),
    Transaction(id: 'tx001', title: 'Buy bread', amount: 12.0, date: DateTime(2023,1,11)),
    Transaction(id: 'tx001', title: 'Buy tea', amount: 7.0, date: DateTime(2023,1,12)),
    Transaction(id: 'tx001', title: 'Buy rice', amount: 8.0, date: DateTime(2023,1,13))
  ];

  void _addTransaction(Transaction transaction) {
    setState(() {
      _transactions.add(transaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CreateTransaction(_addTransaction),
        TransactionList(transactions: _transactions),
      ],
    );
  }
}