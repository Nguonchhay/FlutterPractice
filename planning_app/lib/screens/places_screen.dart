import 'package:flutter/material.dart';


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
