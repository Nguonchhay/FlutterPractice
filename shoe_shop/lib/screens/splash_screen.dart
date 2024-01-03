import 'package:flutter/material.dart';
import 'package:shoe_shop/screens/home_screen.dart';
import 'package:shoe_shop/screens/on_boarding_screen.dart';

class SplashScreen extends StatefulWidget {

  static const routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, OnBoardingScreen.routeName);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlutterLogo(
              size: 100.0,
            ),
            SizedBox(height: 30,),
            Text('Shoe Shop')
          ],
        ),
      ),
    );
  }
}