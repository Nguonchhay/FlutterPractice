import 'package:blog_app/core/theme/app_pallete.dart';
import 'package:blog_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:blog_app/features/auth/presentation/widgets/gradient_button.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  void _onPressed() {

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sign Up.',
              style: TextStyle(
                color: AppPallete.whiteColor,
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            const AuthTextField(hintText: 'Full Name'),
            const SizedBox(
              height: 15.0,
            ),
            const AuthTextField(hintText: 'Email'),
            const SizedBox(
              height: 15.0,
            ),
            const AuthTextField(hintText: 'Password'),
            const SizedBox(
              height: 15.0,
            ),
            AuthGradientButton(
              label: 'Sign Up',
              onPress: _onPressed,
            ),
          ],
        ),
      ),
    );
  }
}
