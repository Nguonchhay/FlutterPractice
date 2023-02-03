import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

import 'package:banana_shop/states/providers/carts_provider.dart';
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
      _isShowAll = value == FilterOptions.All;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    
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
          Consumer<CartProvider>(builder: (_, cartProvider, _) => Container(
            margin: const EdgeInsets.only(top: 10, right: 10),
            child: badges.Badge(
              badgeAnimation: const badges.BadgeAnimation.rotation(
                animationDuration: Duration(seconds: 1),
                colorChangeAnimationDuration: Duration(seconds: 1),
                loopAnimation: false,
                curve: Curves.fastOutSlowIn,
                colorChangeAnimationCurve: Curves.easeInCubic,
              ),
              onTap: () {
          
              },
              badgeContent: Text('${cartProvider.itemCount}'),
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
          ),),
        ],
      ),
      body: ProductList(_isShowAll),
    );
  }
}

