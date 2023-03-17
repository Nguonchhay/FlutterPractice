import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:planning_app/models/place.dart';

class GoogleMapScreen extends StatefulWidget {

  static const routeName = '/map-screen';

  final PlaceLocation initLocation;
  final bool isSelecting;

  const GoogleMapScreen({
    this.initLocation = const PlaceLocation(latitude: 37.422, longitude: -127.084),
    this.isSelecting = false,
    super.key
  });

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.initLocation.latitude, widget.initLocation.longitude),
          zoom: 16,
        ),
      ),
    );
  }
}