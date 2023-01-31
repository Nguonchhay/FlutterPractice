import 'package:flutter/material.dart';

import 'package:meal_app/screens/bottom_nav_screen.dart';
import 'package:meal_app/screens/meal_detail_screen.dart';
import 'package:meal_app/screens/meals_screen.dart';
import 'package:meal_app/screens/search_screen.dart';
// import 'package:meal_app/screens/tabs_screen.dart';
import './screens/categories_screen.dart';


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
      routes: {
        // '/': (ctx) => TabsScreen(),
        '/': (ctx) => BottomNavigationScreen(),
        CategoriesScreen.routeName: (ctx) => CategoriesScreen(),
        MealsScreen.routeName: (ctx) => MealsScreen(),
        MealDetialScreen.routeName: (ctx) => MealDetialScreen(),
        SearchScreen.routeName: (ctx) => SearchScreen(),
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
