import 'package:banana_shop/screens/admins/products/product_new_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:banana_shop/widgets/products/admin_product_item.dart';


class ProductsScreen extends StatelessWidget {
  static const routeName = '/admins-products';

  ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed(ProductNewScreen.routeName);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsProvider.products.length,
        itemBuilder: (ctx, ind) => Column(
          children: [
            AdminProductItem(
              productsProvider.products[ind].id,
              productsProvider.products[ind].title,
              productsProvider.products[ind].imageUrl
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}