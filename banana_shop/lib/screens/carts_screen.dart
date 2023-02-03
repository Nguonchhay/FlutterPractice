import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/providers/carts_provider.dart';


class CartsScreen extends StatelessWidget {
  static const routeName = '/carts';

  CartsScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Chip(
                    label: Text('\$${cartProvider.totalAmount}'),
                    labelStyle: const TextStyle(
                      color: Colors.white
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ]),
            ),
          ),
        ],
      ),
    );
  }
}