import 'package:flutter/material.dart';

import 'package:widget_demo/screens/home_screen.dart';
import 'package:widget_demo/screens/image_screen.dart';
import 'package:widget_demo/screens/text_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        TextInputScreen.routeName: (ctx) => const TextInputScreen(),
        ImageScreen.routeName: (ctx) => const ImageScreen()
      },
    );
  }
}
