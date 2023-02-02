import 'package:flutter/material.dart';

import 'package:banana_shop/models/product.dart';


class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final routeProduct = ModalRoute.of(context)!.settings.arguments as Product;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeProduct.title),
      ),
      body: Center(
        child: const Text('Shop Data')
      ),
    );
  }
}