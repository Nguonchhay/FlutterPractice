import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_demo/models/user.dart';
import 'package:widget_demo/providers/auth_provider.dart';
import 'package:widget_demo/screens/bottom_nav/bottom_nav_bar_screen.dart';
import 'package:widget_demo/screens/image_screen.dart';
import 'package:widget_demo/screens/list/lists_screen.dart';
import 'package:widget_demo/screens/message_screen.dart';
import 'package:widget_demo/screens/search_bar/custom_search_bar_screen.dart';
import 'package:widget_demo/screens/text_input_screen.dart';
import 'package:widget_demo/screens/user_detail_screen.dart';
import 'package:widget_demo/screens/user_screen.dart';


class HomeScreen extends StatelessWidget {

  static const routeName = '/home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context, listen: false);

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
        case ListScreen.routeName:
          Navigator.pushNamed(context, ListScreen.routeName);
          break;
        case CustomSearchBarScreen.routeName:
          Navigator.pushNamed(context, CustomSearchBarScreen.routeName);
          break;
        case BottomNavigationBarScreen.routeName:
          Navigator.pushReplacementNamed(context, BottomNavigationBarScreen.routeName);
          break;
        case UsersScreen.routeName:
          Navigator.pushNamed(context, UsersScreen.routeName);
          break;
        case UserDetailScreen.routeName:
          Navigator.pushNamed(context, UserDetailScreen.routeName);
          break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
            onPressed: () {
              authProvider.user = User(
                email: 'admin@gmail.com',
                id: '001',
                name: 'Admin User'
              );
              goToScreen(UserDetailScreen.routeName);
            }, 
            icon: const Icon(Icons.login),
          ),
        ],
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
              const SizedBox(height: 10.0,),
              TextButton(
                child: const Text('Image Widget'),
                onPressed: () {
                  goToScreen(ImageScreen.routeName);
                }, 
              ),
              const SizedBox(height: 10.0,),
              TextButton(
                child: const Text('Message Popup'),
                onPressed: () {
                  goToScreen(MessageScreen.routeName);
                }, 
              ),
              const SizedBox(height: 10.0,),
              TextButton(
                child: const Text('Lists'),
                onPressed: () {
                  goToScreen(ListScreen.routeName);
                }, 
              ),
              const SizedBox(height: 10.0,),
              TextButton(
                child: const Text('Search in AppBar'),
                onPressed: () {
                  goToScreen(CustomSearchBarScreen.routeName);
                }, 
              ),
              const SizedBox(height: 10.0,),
              TextButton(
                child: const Text('Bottom Navigation'),
                onPressed: () {
                  goToScreen(BottomNavigationBarScreen.routeName);
                }, 
              ),
              const SizedBox(height: 10.0,),
              TextButton(
                child: const Text('Provider State - Consumer'),
                onPressed: () {
                  goToScreen(UsersScreen.routeName);
                }, 
              ),
            ],
          ),
        ),
      ),
    );
  }
}