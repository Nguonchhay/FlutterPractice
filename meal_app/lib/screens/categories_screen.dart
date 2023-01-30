import 'package:flutter/material.dart';

import '../models/category.dart';
import '../widgets/categories/category_item.dart';
import './../mock-data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {

  static String routeName = '/categories';

  CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: DUMMY_CATEGORIES
        .map((categoryData) => CategoryItem(
          Category(
            id: categoryData.id, 
            title: categoryData.title, 
            color: categoryData.color
          )
        ))
        .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 290,
        childAspectRatio: 3/2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
    );
  }
}