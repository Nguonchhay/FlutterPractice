import 'package:flutter/material.dart';
import 'package:meal_app/screens/meals_screen.dart';

import './screens/categories_screen.dart';
import './configs/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal App',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ThemeData().colorScheme.copyWith(secondary: Colors.amber),
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1)
          ),
          subtitle1: TextStyle(
            fontSize: 20,
          ),
        )
      ),
      home: CategoriesScreen(),
      routes: {
        ROUTER_NAMES['CATEGORIES_SCREEN'].toString(): (ctx) => CategoriesScreen(),
        ROUTER_NAMES['MEALS_SCREEN'].toString(): (ctx) => MealsScreen()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App'),
      ),
      body: Center(
        child: Text('Navigation content'),
      ),
    );
  }
}
