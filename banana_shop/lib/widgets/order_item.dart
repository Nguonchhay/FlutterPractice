import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:banana_shop/states/models/order.dart';


class OrderItem extends StatefulWidget {
  final Order order;

  OrderItem(this.order, {super.key});

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {

  bool _isExpanded = false;

  void toggleExpanse() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${widget.order.amount}'),
            subtitle: Text(
              DateFormat('dd/MMM/yy hh:mm').format(widget.order.dateTime)
            ),
            trailing: IconButton(
              icon: Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
              onPressed: toggleExpanse,
            ),
          ),
          if (_isExpanded)
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15, 
                vertical: 10
              ),
              height: min(widget.order.products.length * 20.0 + 20, 180),
              child: ListView(
                children: widget.order.products.map(
                  (product) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('${product.quantity} * ${product.price}'),
                    ],
                  ),
                ).toList(),
              ),
            ),
        ],
      ),
    );
  }
}