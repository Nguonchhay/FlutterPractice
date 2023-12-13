import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {

  static const routeName = '/image-screen';

  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Widget'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(children: [
            Container(
              height: 120.0,
              width: double.infinity,
              padding: const EdgeInsets.all(5.0),
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
              ),
              child: const Image(
                image: AssetImage("images/thumbnail.jpg"),
                fit: BoxFit.cover,
              ),
            ),
        
            const SizedBox(height: 15.0,),
        
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: const Image(
                image: NetworkImage("https://fastly.picsum.photos/id/804/300/200.jpg?hmac=_tTQBR-aR5JPD5uNMllgJat9GdIL5-GfesYs-UzwvzI"),
                fit: BoxFit.cover,
              ),
            ),
        
            const SizedBox(height: 15.0,),
        
            Image.asset("images/thumbnail.jpg"),
        
            const SizedBox(height: 15.0,),
        
            const CircleAvatar(
              backgroundImage: AssetImage("images/thumbnail.jpg"),
              radius: 100.0,
              child: Text('Profile'),
            ),
          ]),
        ),
      ),
    );
  }
}