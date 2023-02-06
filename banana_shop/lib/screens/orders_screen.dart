import 'package:banana_shop/widgets/order_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/providers/orders_provider.dart';


class OrderScreens extends StatelessWidget {
  static const routeName = '/orders';

  OrderScreens({super.key});

  @override
  Widget build(BuildContext context) {
    final orderProvider = Provider.of<OrdersProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, ind) => OrderItem(orderProvider.orders[ind]),
        itemCount: orderProvider.itemCount,
      ),
    );
  }
}