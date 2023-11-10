import 'package:flutter/material.dart';
import 'package:widget_demo/screens/text_input_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void goToScreen(screenName) {
      switch(screenName) {
        case 'text_input_screen':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TextInputScreen())
          );
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          children: [
            const Text('Screen'),

            TextButton(
              child: const Text('Text Input'),
              onPressed: () {
                goToScreen('text_input_screen');
              }, 
            ),
          ],
        ),
      ),
    );
  }
}