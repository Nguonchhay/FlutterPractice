import 'package:flutter/material.dart';

import '../../screens/admins/products/product_edit_screen.dart';


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