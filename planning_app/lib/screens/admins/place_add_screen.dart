import 'package:flutter/material.dart';

import 'package:planning_app/widgets/input_image.dart';


class PlaceAddScreen extends StatefulWidget {
  static const routeName = "/admin/place/add";

  PlaceAddScreen({super.key});

  @override
  State<PlaceAddScreen> createState() => _PlaceAddScreenState();
}

class _PlaceAddScreenState extends State<PlaceAddScreen> {

  final _titleController = TextEditingController();


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

                    InputImage(),
                  ],
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
      
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
      
                    }, 
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
