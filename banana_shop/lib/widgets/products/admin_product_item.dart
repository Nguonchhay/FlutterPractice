import 'package:flutter/material.dart';


class AdminProductItem extends StatelessWidget {

  final String title;
  final String imageUrl;

  AdminProductItem(
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