import 'package:banana_shop/states/providers/orders_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/providers/carts_provider.dart';
import 'package:banana_shop/widgets/products/cart_item.dart';


class CartsScreen extends StatelessWidget {
  static const routeName = '/carts';

  CartsScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final orderProvider = Provider.of<OrdersProvider>(context, listen: false);

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
                      orderProvider.addItem(cartProvider.carts.values.toList(), cartProvider.totalAmount);
                      cartProvider.clear();
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                ]),
            ),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (ctx, ind) => CartItem(
                cartProvider.carts.keys.toList()[ind],
                cartProvider.carts.values.toList()[ind].title,
                cartProvider.carts.values.toList()[ind].price,
                cartProvider.carts.values.toList()[ind].quantity
              ),
              itemCount: cartProvider.itemCount,
            )
          ),
        ],
      ),
    );
  }
}