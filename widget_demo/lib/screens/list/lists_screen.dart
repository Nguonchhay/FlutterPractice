import 'package:flutter/material.dart';
import 'package:widget_demo/screens/list/custom_list_screen.dart';
import 'package:widget_demo/screens/list/gridview_count_screen.dart';
import 'package:widget_demo/screens/list/gridview_extent_screen.dart';
import 'package:widget_demo/screens/list/gridview_custom_screen.dart';
import 'package:widget_demo/screens/list/horizonal_list_screen.dart';
import 'package:widget_demo/screens/list/listview_gridview_screen.dart';

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
          ),
          ListTile(
            leading: const Icon(Icons.cut_sharp),
            title: const Text('Custom Listview'),
            onTap: () {
              Navigator.of(context).pushNamed(CustomListViewScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cut_sharp),
            title: const Text('Gridview - Count'),
            onTap: () {
              Navigator.of(context).pushNamed(GridViewCountScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cut_sharp),
            title: const Text('Gridview - Extent'),
            onTap: () {
              Navigator.of(context).pushNamed(GridViewExtentScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cut_sharp),
            title: const Text('Gridview - Custom'),
            onTap: () {
              Navigator.of(context).pushNamed(GridViewCustomScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.cut_sharp),
            title: const Text('LstView and Gridview'),
            onTap: () {
              Navigator.of(context).pushNamed(ListViewAndGridViewScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}