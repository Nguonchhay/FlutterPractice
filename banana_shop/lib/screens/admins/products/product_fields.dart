import 'package:flutter/material.dart';


class ProductFields extends StatefulWidget {
  ProductFields({super.key});

  @override
  State<ProductFields> createState() => _ProductFieldsState();
}

class _ProductFieldsState extends State<ProductFields> {

  final _imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        height: 400,
        width: 300,
        child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                label: Text('Title'),
              ),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Price'),
              ),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(
                label: Text('Description'),
              ),
              maxLines: 3,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.multiline,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 10, right: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.grey
                    ),
                  ),
                  child: _imageUrlController.text.isEmpty ? Text('Enter an image URL') : FittedBox(
                    child: Image.network(
                      _imageUrlController.text,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    controller: _imageUrlController,
                    decoration: InputDecoration(
                      label: Text('Image URL'),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.url,
                  ),
                ),
              ],
            ),
          ],
        ),
      )
    );
  }
}