import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:planning_app/providers/places_provider.dart';
import 'package:planning_app/screens/admins/place_add_screen.dart';
import 'package:planning_app/screens/place_detail_screen.dart';
import 'package:planning_app/screens/places_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: PlacesProvider(),
      child: MaterialApp(
        title: 'Planning App',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          colorScheme: ThemeData().colorScheme.copyWith(
            secondary: Colors.amber,
          ),
        ),
        home: PlacesScreen(),
        routes: {
          PlacesScreen.routeName: (ctx) => PlacesScreen(),
          PlaceDetailScreen.routeName: (ctx) => PlaceDetailScreen(),
          PlaceAddScreen.routeName: (ctx) => PlaceAddScreen(),
        },
      ),
    );
  }
}
