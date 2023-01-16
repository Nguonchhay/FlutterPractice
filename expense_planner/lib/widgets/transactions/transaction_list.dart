import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';

import 'transaction_item.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList({ required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctx, ind) {
          return TransactionItem(transaction: transactions[ind]);
        },
        itemCount: transactions.length,
      ),
    );
  }
}