import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:banana_shop/states/models/order.dart';


class OrderItem extends StatelessWidget {
  final Order order;

  OrderItem(this.order, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${order.amount}'),
            subtitle: Text(
              DateFormat('dd/MMM/yy hh:mm').format(order.dateTime)
            ),
            trailing: IconButton(
              icon: const Icon(Icons.expand_more),
              onPressed: () {

              },
            ),
          ),
        ],
      ),
    );
  }
}