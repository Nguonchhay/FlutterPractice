import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'package:planning_app/services/locatlion_service.dart';
import 'package:planning_app/screens/addons/map_screen.dart';


class InputLocation extends StatefulWidget {

  final Function onSelectLocation;

  const InputLocation(this.onSelectLocation, {super.key});

  @override
  State<InputLocation> createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {

  String? _previewImage;

  Future<void> _getCurrentUserLocation() async {
    final LocationData locationData = await Location().getLocation();
    setState(() {
      _previewImage = LocationService.generateLocationPreviewImage(
        latitude: locationData.latitude!,
        longitude: locationData.longitude!
      );
    });
    widget.onSelectLocation(locationData.latitude, locationData.longitude);
  }
  
  Future<void> _selectOnMap() async {
    final LatLng selectedLocation = await Navigator.of(context).push(MaterialPageRoute(
      fullscreenDialog: true,
      builder: (ctx) => const GoogleMapScreen(isSelecting: true,))
    );

    if (selectedLocation != null) {
      setState(() {
        _previewImage = LocationService.generateLocationPreviewImage(
          latitude: selectedLocation.latitude,
          longitude: selectedLocation.longitude
        );
      });
      widget.onSelectLocation(selectedLocation.latitude, selectedLocation.longitude);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 170,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImage == null ? 
            const Text('No location', textAlign: TextAlign.center,) : 
            Image.network(_previewImage!),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
              onPressed: _getCurrentUserLocation, 
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
            TextButton.icon(
              onPressed: _selectOnMap, 
              icon: const Icon(Icons.map),
              label: const Text('Select on Map'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}