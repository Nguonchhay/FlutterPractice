import 'package:flutter/material.dart';

import 'package:meal_app/widgets/meals/meal_item.dart';
import 'package:meal_app/models/category.dart';
import 'package:meal_app/mock-data/dummy_data.dart';

class MealsScreen extends StatefulWidget {

  static String routeName = '/meals';

  // final Category category;

  // MealsScreen(this.category, {super.key});

  @override
  State<MealsScreen> createState() => _MealsScreenState();
}

class _MealsScreenState extends State<MealsScreen> {

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context)!.settings.arguments as Category;
    final filteredMeals = DUMMY_MEALS.where((meal) => meal.categories.contains(routeArgs.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgs.title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, ind) {
          return MealItem(filteredMeals[ind]);
        },
        itemCount: filteredMeals.length,
      ),
    );
  }
}