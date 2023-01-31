import 'package:flutter/material.dart';


class SearchScreen extends StatefulWidget {
  static const routeName = '/search';

  SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('Search result'),
      ),
    );
  }
}