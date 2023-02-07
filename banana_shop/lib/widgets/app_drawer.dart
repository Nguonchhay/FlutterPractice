import 'package:banana_shop/screens/orders_screen.dart';
import 'package:flutter/material.dart';

import 'package:banana_shop/screens/admin_products_screen.dart';


class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: const Text('BS Shop'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('Shop'),
            onTap: () {
              Navigator.of(context).pushNamed('/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.receipt),
            title: const Text('Orders'),
            onTap: () {
              Navigator.of(context).pushNamed(OrderScreens.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.production_quantity_limits_rounded),
            title: const Text('Products'),
            onTap: () {
              Navigator.of(context).pushNamed(AdminProductsScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}