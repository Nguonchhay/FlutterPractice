import 'package:flutter/material.dart';
import 'package:widget_demo/models/category.dart';

class GridViewCustomScreen extends StatefulWidget {

  static const routeName = '/lists/gridview-custom';

  const GridViewCustomScreen({super.key});

  @override
  State<GridViewCustomScreen> createState() => _GridViewCustomScreenState();
}

class _GridViewCustomScreenState extends State<GridViewCustomScreen> {

  final List<Category> categories = [
    Category(title: 'Milk'),
    Category(title: 'Water'),
    Category(title: 'Phone'),
    Category(title: 'Fruit'),
    Category(title: 'Food'),
    Category(title: 'News'),
    Category(title: 'Technology'),
    Category(title: 'Resort'),
    Category(title: 'Milk 1'),
    Category(title: 'Water 1'),
    Category(title: 'Phone 1'),
    Category(title: 'Fruit 1'),
    Category(title: 'Food 1'),
    Category(title: 'News 1'),
    Category(title: 'Technology 1'),
    Category(title: 'Resort 1'),
  ];

  Widget _buildGridViewItem(Category category) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue,
          width: 1.0,
        ),
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Center(
        child: Text(category.title)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View - Custom'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 15.0,
        ),
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          return _buildGridViewItem(categories[index]);
        }
      ),
    );
  }
}