import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';


import 'transaction_item.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  const TransactionList({ required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Card (
      child: Column(
        children: transactions.map((tran) {
          return TransactionItem(transaction: tran);
        }).toList(),
      ),
    );
  }
}