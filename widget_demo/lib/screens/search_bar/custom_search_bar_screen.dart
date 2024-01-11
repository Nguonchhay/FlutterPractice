import 'package:flutter/material.dart';

class CustomSearchBarScreen extends StatefulWidget {

  static const routeName = '/search-bar/custom';

  const CustomSearchBarScreen({super.key});

  @override
  State<CustomSearchBarScreen> createState() => _CustomSearchBarScreenState();
}

class _CustomSearchBarScreenState extends State<CustomSearchBarScreen> {

  TextEditingController _searchController = TextEditingController();
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