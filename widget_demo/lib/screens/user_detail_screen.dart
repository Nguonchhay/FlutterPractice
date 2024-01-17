import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_demo/providers/auth_provider.dart';

class UserDetailScreen extends StatefulWidget {
  static const routeName = '/users/detail';

  const UserDetailScreen({super.key});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Center(
        child: Text(
          "Logged in as ${authProvider.user.name}"
        ),
      ),
    );
  }
}