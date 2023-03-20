import 'package:flutter/material.dart';
import 'package:planning_app/models/place.dart';
import 'package:provider/provider.dart';

import 'package:planning_app/providers/places_provider.dart';
import 'package:planning_app/screens/addons/map_screen.dart';


class PlaceDetailScreen extends StatefulWidget {
  static const routeName = "/place/detail";

  const PlaceDetailScreen({super.key});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {

  Place? _place;

  void _loadPlace(String id) async {
    final queryPlace = await Provider.of<PlacesProvider>(context, listen: false).findOneById(id);
    setState(() {
      _place = queryPlace;
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedPlaceId = ModalRoute.of(context)!.settings.arguments as String;
    _loadPlace(selectedPlaceId);

    return _place == null ? Scaffold(
      appBar: AppBar(title: const Text('Place Detail'),),
      body: Container(
        child: const CircularProgressIndicator(),
      ),
    ) : Scaffold(
      appBar: AppBar(
        title: Text(_place!.title),
      ),
      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: Image.file(
              _place!.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            _place!.location.address,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 10,),
          TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                fullscreenDialog: true,
                builder: (ctx) => GoogleMapScreen(initLocation: _place!.location, isSelecting: false,)
              ));
            }, 
            child: Text(
              'View on Map',
              style: TextStyle(
                color: Theme.of(context).primaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}