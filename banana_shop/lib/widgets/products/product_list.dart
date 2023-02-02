import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/widgets/products/product_item.dart';


class ProductList extends StatelessWidget {
  
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {

    final productsProvider = Provider.of<ProductsProvider>(context);
    final products = productsProvider.products;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, ind) => ProductItem(products[ind]),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}