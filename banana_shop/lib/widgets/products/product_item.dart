import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/models/product.dart';
import 'package:banana_shop/screens/product_detail_screen.dart';


class ProductItem extends StatelessWidget {

  ProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_outline),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {
              product.toggleFavorite();
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Theme.of(context).colorScheme.secondary,
            onPressed: () {},
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: product.id
            );
          },
          child: Image.network(
            product.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}