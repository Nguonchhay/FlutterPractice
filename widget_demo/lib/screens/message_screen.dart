import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MessageScreen extends StatelessWidget {

  static const routeName = '/message';

  const MessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popup Message'),
      ),
      body: SingleChildScrollView(
        
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  Fluttertoast.showToast(
                    msg: 'This is a toast message',
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                  );
                }, 
                child: const Text('Show Toast'),
              ),
              const SizedBox(height: 15.0,),
              TextButton(
                onPressed: () {
                  var snackBar = const SnackBar(content: Text('This is a snackbar'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);  
                }, 
                child: const Text('SnackBar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}