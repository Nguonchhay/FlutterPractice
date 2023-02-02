import 'package:flutter/material.dart';

import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:banana_shop/widgets/products/product_list.dart';
import 'package:provider/provider.dart';

enum FilterOptions {
  All,
  Favorites
}

class ProductsOverViewScreen extends StatefulWidget {
  static const routeName = '/products';

  const ProductsOverViewScreen({super.key});

  @override
  State<ProductsOverViewScreen> createState() => _ProductsOverViewScreenState();
}

class _ProductsOverViewScreenState extends State<ProductsOverViewScreen> {

  bool _isShowAll = true;

  void updateFilterOption(FilterOptions value) {
    setState(() {
      if (value == FilterOptions.All) {
        _isShowAll = true;
      } else {
        _isShowAll = false;
      }
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: <Widget>[
          PopupMenuButton(
            icon: const Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedOption) => updateFilterOption(selectedOption),
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
      body: ProductList(_isShowAll),
    );
  }
}

