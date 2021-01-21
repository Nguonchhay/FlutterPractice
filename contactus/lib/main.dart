import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Contact Us", style: TextStyle(color: Colors.orange)),
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: <Widget>[
            Center(
                child: Image.asset('images/contact.png', height: 200,)
            )
          ],
        ),
      )
    );
  }
}
