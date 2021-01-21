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
            SizedBox(height: 30, ),
            Center(
                child: Image.asset('images/contact.png', height: 200,)
            ),
            SizedBox(height: 15, ),
            Text('If you need help \n feel free to contact us', style: TextStyle(fontSize: 20, color: Colors.grey[800])),

            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 150,
                      color: Colors.grey,
                      child: Text('Container 1')
                    ),
                  ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                      height: 100,
                      width: 150,
                       color: Colors.grey,
                      child: Text('Container 2')
                 ),
                )
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 100,
                      width: 150,
                      color: Colors.grey,
                      child: Text('Container 1')
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      height: 100,
                      width: 150,
                      color: Colors.grey,
                      child: Text('Container 2')
                  ),
                )
              ],
            ),
          ],
        ),
      )
    );
  }
}
