import 'package:flutter/material.dart';
import 'package:planning_app/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

import 'package:planning_app/providers/places_provider.dart';
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
      body: FutureBuilder(
        future: Provider.of<PlacesProvider>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting 
          ? const Center(
              child: CircularProgressIndicator(),
            ) 
          : Consumer<PlacesProvider>(
          child: const Center(
            child: Text('There is no place!')
          ),
          builder: (ctx, placeData, ch) => 
            placeData.places.isEmpty ? ch! : ListView.builder(
              itemCount: placeData.places.length,
              itemBuilder: (ctx, ind) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(
                    placeData.places[ind].image
                  ),
                ),
                title: Text(placeData.places[ind].title),
                subtitle: Text(placeData.places[ind].location.address),
                onTap: () {
                  Navigator.of(context).pushNamed(PlaceDetailScreen.routeName, arguments: placeData.places[ind].id);
                },
              )
            ),
        ),
      ),
    );
  }
}
