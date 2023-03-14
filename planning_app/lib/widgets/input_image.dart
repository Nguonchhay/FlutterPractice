import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class InputImage extends StatefulWidget {
  InputImage({super.key});

  @override
  State<InputImage> createState() => _InputImageState();
}

class _InputImageState extends State<InputImage> {

  File? _storedImage;

  Future<void> _takePicker() async {
    final picker = ImagePicker();
    final XFile? selectedFile = await picker.pickImage(
      source: ImageSource.camera,
      maxHeight: 600
    );
    
    setState(() {
      _storedImage = File(selectedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 150,
          width: 150,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Colors.grey,
            )
          ),
          alignment: Alignment.center,
          child: _storedImage != null ? 
            Image.file(
              _storedImage!, 
              fit: BoxFit.cover,
              width: double.infinity,
            ) : const Text('No image taken', textAlign: TextAlign.center,),
        ),
        const SizedBox(width: 10,),
        Expanded(
          child: TextButton.icon(
            icon: const Icon(Icons.camera),
            label: const Text('Take Picture'),
            onPressed: _takePicker,
          ),
        ),
      ],
    );
  }
}
