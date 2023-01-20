import 'package:flutter/material.dart';

import 'package:expense_planner/models/transaction.dart';
import 'package:intl/intl.dart';


class CreateTransaction extends StatefulWidget {
  
  Function addTransactionHandler;

  CreateTransaction(this.addTransactionHandler, {super.key});

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  String inputTitle = '';
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  Transaction _getTransaction() {
    double inputAmount = double.parse(amountController.text.toString());

    return Transaction(
      id: DateTime.now().toIso8601String(), 
      title: inputTitle, 
      amount: inputAmount, 
      date: _selectedDate == null ? DateTime.now() : _selectedDate!
    );
  }

  void _displayDatePicker() {
    showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2020), 
      lastDate: DateTime.now(),
    ).then((pickedDate) => {
      if (pickedDate != null) {
        setState(() {
          _selectedDate = pickedDate;
        })
      }
    });
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
            height: 70,
            child: Row(
              children: <Widget>[
                Text(
                  _selectedDate == null ? 'No date selected' : DateFormat.yMMMd().format(_selectedDate!)
                ),
                TextButton(
                  child: Text('Choose Date'),
                  style: TextButton.styleFrom(
                    textStyle: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  onPressed: _displayDatePicker,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                widget.addTransactionHandler(_getTransaction());
                Navigator.of(context).pop();
              },
              child: Text('Add Transaction'),
            ),
          ),
        ],
      ),
    );
  }
}