import 'package:banana_shop/screens/products_overview_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banana Shop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        colorScheme: Theme.of(context).colorScheme.copyWith(
          secondary: Colors.amberAccent
        ), 
      ),
      routes: {
        '/': (ctx) => ProductsOverViewScreen(),
        ProductsOverViewScreen.routeName: (ctx) => ProductsOverViewScreen()
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   MyHomePage({super.key});


//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Banana Shop'),
//       ),
//       body: Center(
//         child: const Text('Shop Data')
//       ),
//     );
//   }
// }
