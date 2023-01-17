import 'package:flutter/material.dart';

import 'package:expense_planner/models/transaction.dart';


class CreateTransaction extends StatefulWidget {
  
  Function addTransactionHandler;

  CreateTransaction(this.addTransactionHandler, {super.key});

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  String inputTitle = '';

  final amountController = TextEditingController();

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
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Column(
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
            keyboardType: TextInputType.number,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: FloatingActionButton(
              onPressed: () {
                widget.addTransactionHandler(getTransaction());
                Navigator.of(context).pop();
              },
              child: Text('+'),
            ),
          ),
        ],
      ),
    );
  }
}