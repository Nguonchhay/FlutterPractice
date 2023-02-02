import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/models/product.dart';



class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';
  
  ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final selectedProductId = ModalRoute.of(context)!.settings.arguments as String;
    final product = Provider.of<ProductsProvider>(context, listen: false).findById(selectedProductId);

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: const Center(
        child: Text('Shop Data')
      ),
    );
  }
}