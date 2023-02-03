import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/providers/carts_provider.dart';
import 'package:banana_shop/states/providers/products_provider.dart';
import 'package:banana_shop/screens/product_detail_screen.dart';
import 'package:banana_shop/screens/products_overview_screen.dart';


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
          secondary: Colors.amberAccent
        ), 
      ),
      routes: {
        '/': (ctx) => ProductsOverViewScreen(),
        ProductsOverViewScreen.routeName: (ctx) => ProductsOverViewScreen(),
        ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
      },
    );
  }
}
