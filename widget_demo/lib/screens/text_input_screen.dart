import 'package:flutter/material.dart';

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Text Input Widgets')
      ),
      body: const Center(
        child: Column(
          children: [
            Text('Simple Text Input')
          ],
        ),
      ),
    );
  }
}