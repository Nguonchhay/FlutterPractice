import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/admins/products/product_edit_screen.dart';
import 'package:banana_shop/states/providers/products_provider.dart';

class AdminProductItem extends StatelessWidget {

  final String id;
  final String title;
  final String imageUrl;

  AdminProductItem(
    this.id,
    this.title, 
    this.imageUrl, 
    { super.key }
  );

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductsProvider>(context, listen: false);

    void deleteProduct(String id) {
      showDialog(
        context: context, 
        builder: (ctx) => AlertDialog(
          title: const Text('Remove Product'),
          content: const Text('Are you sure?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              }, 
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                productProvider.deleteProduct(id);
                Navigator.of(context).pop(true);
              }, 
              child: const Text('Yes'),
            ),
          ],
        ),
      );
    }

    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(imageUrl),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  ProductEditScreen.routeName,
                  arguments: id
                );
              }, 
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                deleteProduct(id);
              }, 
              icon: const Icon(Icons.delete),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}