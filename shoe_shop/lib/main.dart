import 'package:flutter/material.dart';
import 'package:shoe_shop/screens/auth/login_screen.dart';
import 'package:shoe_shop/screens/auth/sign_up_screen.dart';
import 'package:shoe_shop/screens/home_screen.dart';
import 'package:shoe_shop/screens/on_boarding_screen.dart';
import 'package:shoe_shop/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        OnBoardingScreen.routeName: (ctx) => const OnBoardingScreen(),
        LoginScreen.routeName: (ctx) => const LoginScreen(),
        SignUpScreen.routeName: (ctx) => const SignUpScreen(),
      },
    );
  }
}