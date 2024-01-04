import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shoe_shop/screens/auth/sign_up_screen.dart';
import 'package:shoe_shop/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = '/auth-login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _onLogin() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var snackBar = SnackBar(content: Text("Login with $email"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);

    // Navigate to Home
    Navigator.of(context).pushNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 30.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        
                        filled: true,
                        fillColor: Color.fromRGBO(232, 239, 240, 0.39),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        
                        filled: true,
                        fillColor: Color.fromRGBO(232, 239, 240, 0.39),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                      onPressed: () {
                        _onLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        backgroundColor: Colors.lightGreen,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Log In')
                  ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    const Text('---------------- OR ---------------- '),
                    const SizedBox(height: 30.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              log("Facebook login");
                            }, 
                            icon: const FaIcon(FontAwesomeIcons.facebookF),
                          ),
                        ),
                        const SizedBox(width: 15.0,),
                        CircleAvatar(
                          backgroundColor: Colors.redAccent,
                          foregroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {
                              log("Google login");
                            }, 
                            icon: const FaIcon(FontAwesomeIcons.google),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Create a free account now?'),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                      child: const Text('Sign up')
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}