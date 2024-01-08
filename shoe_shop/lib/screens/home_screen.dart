import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoe_shop/screens/auth/login_screen.dart';

class HomeScreen extends StatefulWidget {

  static const routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                children: [
                  TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    style: const TextStyle(
                      backgroundColor: Colors.lightBlue,
                    ),
                    
                  ),
                  IconButton(
                    onPressed: () {

                    }, 
                    icon: const FaIcon(FontAwesomeIcons.cartShopping),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
