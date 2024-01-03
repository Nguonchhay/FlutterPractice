import 'package:flutter/material.dart';
import 'package:shoe_shop/screens/auth/sign_up_screen.dart';
import 'package:shoe_shop/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {

  static const routeName = '/auth-login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _onLogin() {
    String username = usernameController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    var snackBar = SnackBar(content: Text("Login with $username"));
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
                      'Username',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    TextField(
                      controller: usernameController,
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
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    _onLogin();
                  },
                  child: const Text('Log In')
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                  child: const Text('Sign up first')
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}