import 'package:flutter/material.dart';

class TextInputScreen extends StatefulWidget {

  static const routeName = '/text-input-screen';

  const TextInputScreen({super.key});

  @override
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Text Input Widgets')
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                labelText: 'Username'
              ),
            ),

            const SizedBox(height: 15.0,),

            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password'
              ),
            ),

            const SizedBox(height: 15.0,),

            TextField(
              controller: fullNameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                labelText: 'Full Name'
              ),
            ),

            const SizedBox(height: 15.0,),

            const Text('Phone'),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),

            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String data = usernameController.text;
                      var snackBar = SnackBar(content: Text(data));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }, 
                    child: const Text('Login'),
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