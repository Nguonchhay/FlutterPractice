import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import 'package:banana_shop/states/providers/carts_provider.dart';


class CartItem extends StatelessWidget {
  final String id;
  final String title;
  final double price;
  final int quantity;

  CartItem(this.id, this.title, this.price, this.quantity, {super.key});

  String formattedTotal(double total) {
    return NumberFormat("#,##0.00", "en_US").format(total);
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context, listen: false);

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 30,
        ),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cartProvider.removeItem(id);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: FittedBox(
                  child: Text('\$${price}')
                ),
              ),
            ),
            title: Text(title),
            subtitle: Text('Total: \$${formattedTotal(price * quantity)}'),
            trailing: Text('x ${quantity}'),
          ),
        ),
      ),
    );
  }
}