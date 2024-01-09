import 'package:flutter/material.dart';

import 'package:widget_demo/screens/home_screen.dart';
import 'package:widget_demo/screens/image_screen.dart';
import 'package:widget_demo/screens/list/custom_list_screen.dart';
import 'package:widget_demo/screens/list/gridview_count_screen.dart';
import 'package:widget_demo/screens/list/gridview_custom_screen.dart';
import 'package:widget_demo/screens/list/gridview_extent_screen.dart';
import 'package:widget_demo/screens/list/horizonal_list_screen.dart';
import 'package:widget_demo/screens/list/lists_screen.dart';
import 'package:widget_demo/screens/message_screen.dart';
import 'package:widget_demo/screens/text_input_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core Widget Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
      routes: {
        TextInputScreen.routeName: (ctx) => const TextInputScreen(),
        ImageScreen.routeName: (ctx) => const ImageScreen(),
        MessageScreen.routeName: (ctx) => const MessageScreen(),
        ListScreen.routeName: (ctx) => const ListScreen(),
        HorizontalListScreen.routeName: (ctx) => const HorizontalListScreen(),
        CustomListViewScreen.routeName: (ctx) => const CustomListViewScreen(),
        GridViewCountScreen.routeName: (ctx) => const GridViewCountScreen(),
        GridViewExtentScreen.routeName: (ctx) => const GridViewExtentScreen(),
        GridViewCustomScreen.routeName: (ctx) => const GridViewCustomScreen(),
      },
    );
  }
}
