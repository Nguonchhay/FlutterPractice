import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

class CreateAndSaveImageScreen extends StatefulWidget {

  static const routeName = '/image-videos/create-and-save';

  const CreateAndSaveImageScreen({super.key});

  @override
  State<CreateAndSaveImageScreen> createState() => _CreateAndSaveImageScreenState();
}

class _CreateAndSaveImageScreenState extends State<CreateAndSaveImageScreen> {

  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Image and Save'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                var imageObj = await ImagePicker().pickImage(source: ImageSource.camera);
                if (imageObj != null) {
                  GallerySaver.saveImage(imageObj.path);
                }
                showMessage("Image: ${imageObj?.path}");
              },
              child: const Text('Take Picture'),
            ),
          ],
        ),
      ),
    );
  }
}