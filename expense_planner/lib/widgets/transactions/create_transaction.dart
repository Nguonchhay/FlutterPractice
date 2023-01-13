import 'package:flutter/material.dart';

import 'package:expense_planner/models/transaction.dart';


class CreateTransaction extends StatelessWidget {
  
  String inputTitle = '';
  final amountController = TextEditingController();
  Function addTransactionHandler;

  CreateTransaction(this.addTransactionHandler, {super.key});

  Transaction getTransaction() {
    double inputAmount = double.parse(amountController.text.toString());

    return Transaction(
      id: DateTime.now().toIso8601String(), 
      title: inputTitle, 
      amount: inputAmount, 
      date: DateTime.now()
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(
          decoration: const InputDecoration(
            labelText: 'Title'
          ),
          onChanged: (value) {
            inputTitle = value;
          },
        ),
        TextField(
          decoration: const InputDecoration(
            labelText: 'Amount',
          ),
          controller: amountController,
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          child: FloatingActionButton(
            onPressed: () {
              addTransactionHandler(getTransaction());
            },
            child: Text('+'),
          ),
        ),
      ],
    );
  }
}