import 'package:flutter/material.dart';

class HorizontalListScreen extends StatefulWidget {

  static const routeName = '/lists/horizontal';

  const HorizontalListScreen({super.key});

  @override
  State<HorizontalListScreen> createState() => _HorizontalListScreenState();
}

class _HorizontalListScreenState extends State<HorizontalListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Horizontal ListView'),
      ),
      body: Container(
        height: 150.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 150.0,
              margin: const EdgeInsets.all(5.0),
              color: Colors.green,
            ),
            Container(
               width: 150.0,
              margin: const EdgeInsets.all(5.0),
              color: Colors.blue,
            ),
            Container(
               width: 150.0,
              margin: const EdgeInsets.all(5.0),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}