
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/screens/carts_screen.dart';
import 'package:banana_shop/states/providers/orders_provider.dart';
import 'package:banana_shop/states/providers/carts_provider.dart';
import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:banana_shop/screens/product_detail_screen.dart';
import 'package:banana_shop/screens/products_overview_screen.dart';
import 'package:banana_shop/screens/orders_screen.dart';
import 'package:banana_shop/screens/admin_products_screen.dart';


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersProvider(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banana Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          secondary: Colors.amberAccent,
        ), 
      ),
      routes: {
        '/': (ctx) => ProductsOverViewScreen(),
        ProductsOverViewScreen.routeName: (ctx) => ProductsOverViewScreen(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
        CartsScreen.routeName: (ctx) => CartsScreen(),
        OrderScreens.routeName: (ctx) => OrderScreens(),
        AdminProductsScreen.routeName: (ctx) => AdminProductsScreen(),
      },
    );
  }
}
