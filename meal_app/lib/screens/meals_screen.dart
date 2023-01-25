import 'package:flutter/material.dart';

import '../models/category.dart';


class MealsScreen extends StatefulWidget {

  // final Category category;

  // MealsScreen(this.category, {super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Category;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: Center(
        child: Text('Navigation content'),
      ),
    );
  }
}