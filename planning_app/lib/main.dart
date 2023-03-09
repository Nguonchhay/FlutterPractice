import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planning App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        colorScheme: ThemeData().colorScheme.copyWith(
          secondary: Colors.amber,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Planning App'),
      ),
      body: const Center(
        child: Text('Welcome to Planning App',),
      ),
    );
  }
}
