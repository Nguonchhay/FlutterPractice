import 'package:flutter/material.dart';

import 'package:planning_app/screens/admins/place_add_screen.dart';


class PlacesScreen extends StatelessWidget {
  static const routeName = "/places";


  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Places'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(PlaceAddScreen.routeName);
            }, 
            icon: const Icon(Icons.add)
          ),
        ],
      ),
      body: Container(
        child: null,
      ),
    );
  }
}
