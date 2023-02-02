import 'package:flutter/material.dart';

import 'package:banana_shop/widgets/products/product_list.dart';


class ProductsOverViewScreen extends StatelessWidget {
  static const routeName = '/products';

  const ProductsOverViewScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      body: ProductList(),
    );
  }
}

