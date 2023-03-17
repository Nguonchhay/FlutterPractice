import 'package:flutter/material.dart';


class InputLocation extends StatefulWidget {
  const InputLocation({super.key});

  @override
  State<InputLocation> createState() => _InputLocationState();
}

class _InputLocationState extends State<InputLocation> {

  String? _previewImage;

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
              onPressed: () {

              }, 
              icon: const Icon(Icons.location_on),
              label: const Text('Current Location'),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
            ),
            TextButton.icon(
              onPressed: () {

              }, 
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