import 'package:flutter/material.dart';
import 'package:shoe_shop/screens/auth/login_screen.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(LoginScreen.routeName);
            }, 
            icon: const Icon(Icons.shop),
          ),
        ],
      ),
      body: const Center(
        child: Text('Content'),
      ),
    );
  }
}
