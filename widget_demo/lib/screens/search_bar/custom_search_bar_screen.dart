import 'package:flutter/material.dart';
import 'package:widget_demo/screens/search_bar/sliver_app_bar_screen.dart';

class CustomSearchBarScreen extends StatefulWidget {

  static const routeName = '/search-bar/custom';

  const CustomSearchBarScreen({super.key});

  @override
  State<CustomSearchBarScreen> createState() => _CustomSearchBarScreenState();
}

enum MenuSearchBar {
  SliverAppBar,
  SearchBarWithLib,
  SearchBarWithIcon
}

class _CustomSearchBarScreenState extends State<CustomSearchBarScreen> {

  final TextEditingController _searchController = TextEditingController();
  final _data = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Lemon',
    'Mango',
    'Orange',
    'Papaya',
    'Peach',
    'Plum',
    'Raspberry',
    'Strawberry',
    'Watermelon',
  ];
  List<String> _filteredData = [];
  bool _isLoading = false;

  MenuSearchBar? _selectedMenuItem;

  @override
  void initState() {
    super.initState();
    _filteredData = _data;
    _isLoading = false;
    _searchController.addListener(_performSearch);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _performSearch() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(microseconds: 1000));


    setState(() {
      _filteredData = _data.where(
        (item) => item.toLowerCase().contains(_searchController.text.toLowerCase())
      ).toList();
      _isLoading = false;
    });
    
  }

  void _goToScreen() {
    if (_selectedMenuItem == MenuSearchBar.SliverAppBar) {
      // Navigator.of(context).pushNamed(SliverAppBarScreen.routeName);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SliverAppBarScreen())
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purple.shade100],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            ),
          ),
        ),
        title: TextField(
          controller: _searchController,
          style: const TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          decoration: const InputDecoration(
            hintText: 'Search ...',
            hintStyle: TextStyle(color: Colors.white24),
            border: InputBorder.none,
          ),
        ),
        actions: [
          PopupMenuButton<MenuSearchBar>(
            initialValue: _selectedMenuItem,
            onSelected: (MenuSearchBar item) {
              setState(() {
                _selectedMenuItem = item;
              });
              _goToScreen();
            },
            itemBuilder: (ctx) => <PopupMenuEntry<MenuSearchBar>>[
              const PopupMenuItem<MenuSearchBar>(
                value: MenuSearchBar.SliverAppBar,
                child: Text("SliverAppBar"),
              ),
              const PopupMenuItem<MenuSearchBar>(
                value: MenuSearchBar.SearchBarWithLib,
                child: Text("SearchBarWithLib"),
              ),
              const PopupMenuItem<MenuSearchBar>(
                value: MenuSearchBar.SearchBarWithIcon,
                child: Text("SearchBarWithIcon"),
              ),
            ],
          ),
        ],
      ),
      body: _isLoading ? const Center(
        child: CircularProgressIndicator(color: Colors.white),
      ) : ListView.builder(
        itemCount: _filteredData.length,
        itemBuilder: (ctx, ind) => ListTile(
          title: Text(
            _filteredData[ind],
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurple.shade900,
    );
  }
}