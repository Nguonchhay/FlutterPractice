import 'dart:io';

import 'package:flutter/material.dart';

import 'package:planning_app/models/place.dart';
import 'package:planning_app/services/db_service.dart';


class PlacesProvider with ChangeNotifier {

  static const String TABLE_NAME= 'places';

  List<Place> _places = [];


  List<Place> get places {
    return [..._places];
  }

  void create(Place place) {
    _places.add(place);
    notifyListeners();

    DatabaseService.insert(PlacesProvider.TABLE_NAME, place.toObject);
  }

  Future<void> fetchAndSetPlaces() async {
    final result = await DatabaseService.query(PlacesProvider.TABLE_NAME);
    _places = result.map((item) => Place(
      id: item['id'],
      title: item['title'],
      location: PlaceLocation(latitude: 0.0, longitude: 0.0),
      image: File(item['image'])
    )).toList();
    notifyListeners();
  }
}