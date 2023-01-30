import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';


class MealDetialScreen extends StatelessWidget {

  static const routeName = '/meals/detail';

  MealDetialScreen({super.key});

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,),
      child: Text(
        title,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey,),
          borderRadius: BorderRadius.circular(10)
        ),
        height: 200,
        width: 300,
        margin: const EdgeInsets.all(5),
        child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final routeArgMeal = ModalRoute.of(context)!.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeArgMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                routeArgMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, ind) {
                  return Card(
                    margin: const EdgeInsets.all(15),
                    color: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(routeArgMeal.ingredients[ind]),
                    ),
                  );
                },
                itemCount: routeArgMeal.ingredients.length
              ,),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, ind) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${ind + 1}'),
                        ),
                        title: Text(routeArgMeal.steps[ind]),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: routeArgMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}