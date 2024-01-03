import 'package:flutter/material.dart';
import 'package:widget_demo/screens/image_screen.dart';
import 'package:widget_demo/screens/message_screen.dart';
import 'package:widget_demo/screens/text_input_screen.dart';


class HomeScreen extends StatelessWidget {

  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    void goToScreen(screenName) {
      switch(screenName) {
        case TextInputScreen.routeName:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TextInputScreen())
          );
          break;
        case ImageScreen.routeName:
          Navigator.pushNamed(context, ImageScreen.routeName);
          break;
        case MessageScreen.routeName:
          Navigator.pushNamed(context, MessageScreen.routeName);
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.cyan,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text('Screen'),
        
              TextButton(
                child: const Text('Text Input Widget'),
                onPressed: () {
                  goToScreen(TextInputScreen.routeName);
                }, 
              ),
              const SizedBox(height: 15.0,),
              TextButton(
                child: const Text('Image Widget'),
                onPressed: () {
                  goToScreen(ImageScreen.routeName);
                }, 
              ),
              const SizedBox(height: 15.0,),
              TextButton(
                child: const Text('Message Popup'),
                onPressed: () {
                  goToScreen(MessageScreen.routeName);
                }, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}