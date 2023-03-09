import 'package:flutter/material.dart';

import 'package:planning_app/models/place.dart';


class PlacesProvider with ChangeNotifier {

  List<Place> _places = [];


  List<Place> get places {
    return [..._places];
  }
  
}