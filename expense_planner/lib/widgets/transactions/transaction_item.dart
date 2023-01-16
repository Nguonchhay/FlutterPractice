import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction.dart';

class TransactionItem extends StatelessWidget {

  final Transaction transaction;

  TransactionItem({ required this.transaction, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0
            ),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.purple, width: 2),
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              '\$ ${transaction.amount.toString()}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.purple,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                transaction.title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )
              ),
              Text(
                DateFormat('dd-MMM-yyyy').format(transaction.date),
                style: const TextStyle(
                  color: Colors.grey,
                )
              )
            ],
          )
        ],
      )
    );
  }
}