import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_demo/providers/auth_provider.dart';
import 'package:widget_demo/screens/bottom_nav/bottom_nav_bar_screen.dart';

import 'package:widget_demo/screens/home_screen.dart';
import 'package:widget_demo/screens/image_screen.dart';
import 'package:widget_demo/screens/list/custom_list_screen.dart';
import 'package:widget_demo/screens/list/gridview_count_screen.dart';
import 'package:widget_demo/screens/list/gridview_custom_screen.dart';
import 'package:widget_demo/screens/list/gridview_extent_screen.dart';
import 'package:widget_demo/screens/list/horizonal_list_screen.dart';
import 'package:widget_demo/screens/list/lists_screen.dart';
import 'package:widget_demo/screens/list/listview_gridview_screen.dart';
import 'package:widget_demo/screens/message_screen.dart';
import 'package:widget_demo/screens/search_bar/custom_search_bar_screen.dart';
import 'package:widget_demo/screens/search_bar/sliver_app_bar_screen.dart';
import 'package:widget_demo/screens/text_input_screen.dart';
import 'package:widget_demo/screens/user_detail_screen.dart';
import 'package:widget_demo/screens/user_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: MaterialApp(
        title: 'Core Widget Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          primarySwatch: Colors.orange,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
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
          ListViewAndGridViewScreen.routeName: (ctx) => const ListViewAndGridViewScreen(),

          CustomSearchBarScreen.routeName: (ctx) => const CustomSearchBarScreen(),
          SliverAppBarScreen.routeName: (ctx) => const SliverAppBarScreen(),
          BottomNavigationBarScreen.routeName: (ctx) => const BottomNavigationBarScreen(),
          UsersScreen.routeName: (ctx) => const UsersScreen(),
          UserDetailScreen.routeName: (ctx) => const UserDetailScreen(),
        },
      ),
    );
  }
}
