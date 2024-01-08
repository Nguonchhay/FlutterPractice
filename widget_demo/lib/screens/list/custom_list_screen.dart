import 'package:flutter/material.dart';
import 'package:widget_demo/models/product.dart';

class CustomListViewScreen extends StatefulWidget {

  static const routeName = '/lists/custom';

  const CustomListViewScreen({super.key});

  @override
  State<CustomListViewScreen> createState() => _CustomListViewScreenState();
}

class _CustomListViewScreenState extends State<CustomListViewScreen> {

  List<Product> products = [
    Product(
      title: 'Product 001', 
      quantity: 10, 
      unitPrice: 1.0,
      id: '001',
      imageUrl: 'https://fastly.picsum.photos/id/803/200/200.jpg?hmac=bVMK2xFyXtTrgCuUIozDz-mYxDZuDYFh-C_1LHZDKL4',
      description: 'You can specify how many words should be generated right next to the word "lorem". For example, lorem5 will generate a 5-words dummy text.'
    ),
    Product(
      title: 'Product 002', 
      quantity: 5, 
      unitPrice: 2.0,
      id: '002',
      imageUrl: 'https://fastly.picsum.photos/id/856/200/200.jpg?hmac=0i-cnhrzdHoF0g75vH6s_S8RUe5ej3nWdKiqxfYhuTo',
      description: 'You can specify how many words should be generated right next to the word "lorem". For example, lorem5 will generate a 5-words dummy text.'
    ),
    Product(
      title: 'Product 003', 
      quantity: 2, 
      unitPrice: 1.5,
      id: '003',
      imageUrl: 'https://fastly.picsum.photos/id/322/200/200.jpg?hmac=h5_-NQtnn86YBEwVT2_4zcSeuxpCnMAdriBcZchtfas',
      description: 'You can specify how many words should be generated right next to the word "lorem". For example, lorem5 will generate a 5-words dummy text.'
    ),
  ];

  Widget _renderProductImage(String image) {
    return image == '' ? Image.asset(
      'images/dummy-product.jpg',
      fit: BoxFit.fill,
      height: 250.0,
      width: MediaQuery.of(context).size.width,
    ) : Image.network(
      image,
      fit: BoxFit.fill,
      height: 250.0,
      width: MediaQuery.of(context).size.width,
    );
  }

  Widget _buildListItem(Product product) {
    return Card(
      margin: const EdgeInsets.all(15.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(5.0),
              topRight: Radius.circular(5.0),
            ),
            child: _renderProductImage(product.imageUrl!),
          ),
          ListTile(
            title: Text(
              product.title,
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
            subtitle: Text(product.description!),
            trailing: Text(
              "\$ ${product.unitPrice}",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                minimumSize: Size(MediaQuery.of(context).size.width, 56)
              ),
              child: const Text(
                'Add to cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom ListView'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (ctx, index) => _buildListItem(products[index]),
      ),
    );
  }
}