import 'package:flutter/material.dart';


class MainDrawer extends StatelessWidget {
  MainDrawer({super.key});


  Widget buildListTile(String title, IconData icon) {
    return ListTile(
        leading: Icon(
          icon, 
          size: 26,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: () {
          
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(15),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).primaryColorDark,
            child: Container(
              margin: const EdgeInsets.only(top: 30, ),
              child: Text(
                'Cooking Up !',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Theme.of(context).canvasColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          buildListTile('Meals', Icons.restaurant),
          buildListTile('Filters', Icons.settings),
        ],
      ),
    );
  }
}