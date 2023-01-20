import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_item.dart';


class TransactionList extends StatefulWidget {

  final List<Transaction> transactions;
  Function deleteTransactionHandler;

  TransactionList({ required this.transactions, required this.deleteTransactionHandler, super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  
  void deleteTransaction(String id) {
    showDialog(
      context: context, 
      builder: (BuildContext ctx) {
        return AlertDialog(
          title: const Text('Transaction Deletion'),
          content: const Text('Are you sure?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                widget.deleteTransactionHandler(id);
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return widget.transactions.isEmpty ? Column(
        children: <Widget>[
          const Text('No transactions'),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 300,
            child: Image.asset(
              'assets/images/waiting.png', 
              fit: BoxFit.cover
            ),
          ),
        ],
      ) : ListView.builder(
        itemBuilder: (ctx, ind) {
          // return TransactionItem(transaction: transactions[ind]);
          return Card(
            elevation: 5,
            margin: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10, 
                    horizontal: 5,
                  ),
                  child: FittedBox(
                    child: Text('\$ ${widget.transactions[ind].amount.toString()}'),
                  ),
                ),
              ),
              title:  Text(
                widget.transactions[ind].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(DateFormat.yMMMd().format(widget.transactions[ind].date)),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).errorColor,
                onPressed: () {
                    deleteTransaction(widget.transactions[ind].id);
                },
              ),
            ),
          ); 
        },
        itemCount: widget.transactions.length,
      );
  }
}