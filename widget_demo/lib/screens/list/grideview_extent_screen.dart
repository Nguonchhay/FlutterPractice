import 'package:flutter/material.dart';

class GridViewExtentScreen extends StatefulWidget {

  static const routeName = '/lists/gridview-extent';

  const GridViewExtentScreen({super.key});

  @override
  State<GridViewExtentScreen> createState() => _GridViewExtentScreenState();
}

class _GridViewExtentScreenState extends State<GridViewExtentScreen> {

  Widget _buildGridViewItem(String image) {
    return Image.network(
      image,
      fit: BoxFit.cover,
      width: 150.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grid View - Extent'),
      ),
      body: GridView.extent(
        padding: const EdgeInsets.all(15.0),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 8.0,
        maxCrossAxisExtent: 200.0,
        children: [
          'https://fastly.picsum.photos/id/1/200/200.jpg?hmac=jZB9EZ0Vtzq-BZSmo7JKBBKJLW46nntxq79VMkCiBG8',
          'https://fastly.picsum.photos/id/2/200/200.jpg?hmac=isSWZUpv7D1D156XcADPOCZlfCG9mmvb8OlXFdvLdK0',
          'https://fastly.picsum.photos/id/3/200/200.jpg?hmac=N5yYUNYl5gOUcaMmTtnNNtx839TN2qaNM4SaXhQl65U',
          'https://fastly.picsum.photos/id/1/200/200.jpg?hmac=jZB9EZ0Vtzq-BZSmo7JKBBKJLW46nntxq79VMkCiBG8',
          'https://fastly.picsum.photos/id/2/200/200.jpg?hmac=isSWZUpv7D1D156XcADPOCZlfCG9mmvb8OlXFdvLdK0',
          'https://fastly.picsum.photos/id/3/200/200.jpg?hmac=N5yYUNYl5gOUcaMmTtnNNtx839TN2qaNM4SaXhQl65U',
          'https://fastly.picsum.photos/id/1/200/200.jpg?hmac=jZB9EZ0Vtzq-BZSmo7JKBBKJLW46nntxq79VMkCiBG8',
          'https://fastly.picsum.photos/id/2/200/200.jpg?hmac=isSWZUpv7D1D156XcADPOCZlfCG9mmvb8OlXFdvLdK0',
          'https://fastly.picsum.photos/id/3/200/200.jpg?hmac=N5yYUNYl5gOUcaMmTtnNNtx839TN2qaNM4SaXhQl65U'
        ].map((url) {
          return _buildGridViewItem(url);
        }).toList(),
      ),
    );
  }
}