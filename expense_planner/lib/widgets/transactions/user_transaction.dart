import 'package:expense_planner/widgets/transactions/transaction_list.dart';
import 'package:flutter/material.dart';

import '../../models/transaction.dart';


class UserTransaction extends StatelessWidget {

  final List<Transaction> transactions;
  Function deleteTransactionHandler;

  UserTransaction(this.transactions, this.deleteTransactionHandler, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TransactionList(transactions: transactions, deleteTransactionHandler: deleteTransactionHandler),
      ],
    );
  }
}