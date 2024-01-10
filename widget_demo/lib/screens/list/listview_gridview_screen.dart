import 'package:flutter/material.dart';
import 'package:widget_demo/models/product.dart';

class ListViewAndGridViewScreen extends StatefulWidget {

  static const routeName = '/lists/listview-gridview';

  const ListViewAndGridViewScreen({super.key});

  @override
  State<ListViewAndGridViewScreen> createState() => _ListViewAndGridViewScreenState();
}

class _ListViewAndGridViewScreenState extends State<ListViewAndGridViewScreen> {

  final products = [
    Product(
      title: "Product 1", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 2", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 3", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 4", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 5", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 6", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 7", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 8", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 9", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
    Product(
      title: "Product 10", 
      quantity: 1, 
      unitPrice: 1.0,
      imageUrl: 'https://fastly.picsum.photos/id/141/200/200.jpg?hmac=cy5VCF6f8Mq7cum6d-R7m7mbrGC0wgUzI4UpSX_qkIk'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView and GridView'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text('Latest Products'),
            Container(
              height: 150.0,
              child: ListView.builder(
                // physics: const ScrollPhysics(),
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (ctx, ind) {
                  return Card(
                    elevation: 5,
                    child: SizedBox(
                      height: 150.0,
                      width: 150.0,
                      child: Center(child: Text(products[ind].title))
                    ),
                  );
                }
              ),
            ),
            const SizedBox(height: 15.0,),
            const Text('Latest Products'),
            Container(
              height: 300.0,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                ), 
                itemCount: products.length,
                itemBuilder: (ctx, ind) {
                  return Card(
                      elevation: 5,
                      child: SizedBox(
                        height: 150.0,
                        width: 150.0,
                        child: Center(child: Text(products[ind].title))
                      ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}