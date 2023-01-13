import 'package:flutter/material.dart';

import '../../models/transaction.dart';

class TransactionItem extends StatelessWidget {

  final Transaction transaction;

  const TransactionItem({ required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            child: Text(
              transaction.amount.toString()
            ),
          ),
          Column(
            children: <Widget>[
              Text(transaction.title),
              Text(transaction.date.toIso8601String())
            ],
          )
        ],
      )
    );
  }
}