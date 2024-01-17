import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_demo/models/user.dart';
import 'package:widget_demo/providers/auth_provider.dart';

class UsersScreen extends StatefulWidget {
  static const routeName = '/users';

  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Consumer<AuthProvider>(
          builder: (ctx, authProvider, child) => authProvider.users.isEmpty ? const Center(
            child: Text('No users')
          ) : ListView.builder(
            itemCount: authProvider.users.length,
            itemBuilder: (_, index) {
              return Text(
                "${authProvider.users[index].name}"
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        tooltip: 'New User',
        onPressed: () {
          int time = DateTime.now().microsecondsSinceEpoch;
          Provider.of<AuthProvider>(context, listen: false).addUser(User(
            email: '$time@gmail.com',
            name: 'Name_$time',
            id: "$time"
          ));
        },
        child: const Icon(Icons.add, color: Colors.white,),
      ),
    );
  }
}