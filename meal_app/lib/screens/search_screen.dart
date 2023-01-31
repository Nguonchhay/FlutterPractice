import 'package:flutter/material.dart';

import 'package:meal_app/widgets/main_drawer.dart';


class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  bool _isGlutenFree = false;
  bool _isVeganFree = false;
  bool _isVegetarianFree = false;
  bool _isLactoseFree = false;

  Widget _buildSwitcher(bool currentValue, String title, String? description, Function(bool) updatedValueHandler ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(description!),
      value: currentValue, 
      onChanged: updatedValueHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Expanded(
            child: ListView(children: <Widget>[
              _buildSwitcher(
                _isGlutenFree,
                'Gluten Free', 
                'Only include Gluten Free meals.',
                (newValue) {
                  setState(() {
                    _isGlutenFree = newValue;
                  });
                }
              ),
              _buildSwitcher(
                _isVeganFree,
                'Vegan Free', 
                'Only include Vegan Free meals.',
                (newValue) {
                  setState(() {
                    _isVeganFree = newValue;
                  });
                }
              ),
              _buildSwitcher(
                _isVegetarianFree,
                'Vegetarian Free', 
                'Only include _Vegetarian Free meals.',
                (newValue) {
                  setState(() {
                    _isVegetarianFree = newValue;
                  });
                }
              ),
              _buildSwitcher(
                _isLactoseFree,
                'Lactose Free', 
                'Only include Lactose Free meals.',
                (newValue) {
                  setState(() {
                    _isLactoseFree = newValue;
                  });
                }
              ),
            ],),
          ),
        ],
      ),
    );
  }
}
