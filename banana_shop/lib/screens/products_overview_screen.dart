import 'package:flutter/material.dart';

import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:banana_shop/widgets/products/product_list.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  All,
  Favorites
}

class ProductsOverViewScreen extends StatelessWidget {
  static const routeName = '/products';

  const ProductsOverViewScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    
    final productsProvider = Provider.of<ProductsProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedOption) {
              if (selectedOption == FilterOptions.All) {
                productsProvider.showAll();
              } else {
                productsProvider.showOnlyFavorites();
              }
            },
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('All'),
              ),
              const PopupMenuItem(
                value: FilterOptions.Favorites,
                child: Text('Only favorite'),
              ),
            ],
          ),
        ],
      ),
      body: ProductList(),
    );
  }
}

