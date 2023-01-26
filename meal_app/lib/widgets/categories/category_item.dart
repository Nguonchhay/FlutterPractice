import 'package:flutter/material.dart';

import 'package:meal_app/screens/meals_screen.dart';
import './../../models/category.dart';


class CategoryItem extends StatelessWidget {

  final Category category;

  const CategoryItem(this.category, {super.key});

  void goToMealScreen(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(builder: (_) {
    //     return MealsScreen(category);
    //   },)
    // );
    Navigator.of(ctx).pushNamed(
      MealsScreen.routeName,
      arguments: category
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => goToMealScreen(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.7),
              category.color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ),
      ),
    );
  }
}