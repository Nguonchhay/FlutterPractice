import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';


class MealItem extends StatelessWidget {

  final Meal meal;

  const MealItem(this.meal, {super.key});

  void onTabHandler() {

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTabHandler,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}