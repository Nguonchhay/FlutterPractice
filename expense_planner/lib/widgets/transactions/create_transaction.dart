import 'package:flutter/material.dart';


class CreateTransaction extends StatefulWidget {
  const CreateTransaction({super.key});

  @override
  State<CreateTransaction> createState() => _CreateTransactionState();
}

class _CreateTransactionState extends State<CreateTransaction> {
  String _inputTitle = '';
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            labelText: 'Title'
          ),
          onChanged: (value) {
            _inputTitle = value;
          },
        ),
        TextField(
          decoration: InputDecoration(
            labelText: 'Amount',
          ),
          controller: amountController,
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          child: FloatingActionButton(
            onPressed: () {
              print(_inputTitle);
              print(amountController.text);
            },
            child: Text('+'),
          ),
        ),
      ],
    );
  }
}