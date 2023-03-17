import 'package:flutter/material.dart';

import 'package:planning_app/models/place.dart';
import 'package:planning_app/services/dbservice.dart';


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
  
}