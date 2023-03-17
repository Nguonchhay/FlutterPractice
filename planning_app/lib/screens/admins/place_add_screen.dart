import 'dart:io';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:planning_app/models/place.dart';
import 'package:planning_app/providers/places_provider.dart';
import 'package:planning_app/widgets/input_image.dart';
import 'package:planning_app/widgets/input_location.dart';



class PlaceAddScreen extends StatefulWidget {
  static const routeName = "/admin/place/add";

  PlaceAddScreen({super.key});

  @override
  State<PlaceAddScreen> createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {

  File? _pickedImage;

  final _titleController = TextEditingController();

  void _setSelectImage(File pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _pickedImage!.path.isEmpty) {
      return;
    }
    final placeProvider = Provider.of<PlacesProvider>(context, listen: false);
    placeProvider.create(Place(
      id: DateTime.now().toIso8601String(),
      title: _titleController.text.toString(),
      location: PlaceLocation(latitude: 0.0, longitude: 0.0),
      image: _pickedImage!
    ));

    // Nagivate back to previous screen
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Place'),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        labelText: 'Title'
                      ),
                      controller: _titleController,
                    ),

                    const SizedBox(height: 10,),
                    InputImage(_setSelectImage),

                    const SizedBox(height: 10,),
                    InputLocation(),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _savePlace,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: _savePlace, 
                    icon: const Icon(Icons.add),
                  ),
                  const Text('Add Place'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
