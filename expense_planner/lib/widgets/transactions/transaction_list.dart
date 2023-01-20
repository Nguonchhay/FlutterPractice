import 'package:expense_planner/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'transaction_item.dart';


class TransactionList extends StatelessWidget {

  final List<Transaction> transactions;

  TransactionList({ required this.transactions, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty ? Column(
        children: <Widget>[
          Text('No transactions'),
          SizedBox(
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
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5,
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10, 
                    horizontal: 5,
                  ),
                  child: FittedBox(
                    child: Text('\$ ${transactions[ind].amount.toString()}'),
                  ),
                ),
              ),
              title:  Text(
                transactions[ind].title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(DateFormat.yMMMd().format(transactions[ind].date)),
            ),
          ); 
          
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5,),
                child: FittedBox(
                  child: Text('\$ ${transactions[ind].amount.toString()}'),
                ),
              ),
            ),
            title:  Text(
              transactions[ind].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            subtitle: Text(DateFormat.yMMMd().format(transactions[ind].date)),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}