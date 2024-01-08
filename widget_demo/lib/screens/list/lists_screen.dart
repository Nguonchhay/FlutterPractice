import 'package:flutter/material.dart';
import 'package:widget_demo/screens/list/horizonal_list_screen.dart';

class ListScreen extends StatefulWidget {

  static const routeName = '/lists';

  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Widgets'),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.horizontal_distribute),
            title: const Text('Horizontal Listview'),
            onTap: () {
              Navigator.of(context).pushNamed(HorizontalListScreen.routeName);
            },
          )
        ],
      ),
    );
  }
}