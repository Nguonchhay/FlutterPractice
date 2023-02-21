import 'package:banana_shop/states/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/states/providers/products_provider.dart';


class ProductEditScreen extends StatefulWidget {
  static const routeName = '/admin-product-edit';

  ProductEditScreen({super.key});

  @override
  State<ProductEditScreen> createState() => _ProductEditScreenState();
}

class _ProductEditScreenState extends State<ProductEditScreen> {

  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  // ignore: prefer_typing_uninitialized_variables
  var editProduct;

  void _onSaveProduct() {
    _form.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    final selectedProductId = ModalRoute.of(context)!.settings.arguments as String;
    editProduct = Provider.of<ProductsProvider>(context, listen: false).findById(selectedProductId);
    _imageUrlController.text = editProduct.imageUrl;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product: ${editProduct.title}'),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              _onSaveProduct();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                key: _form,
                child: Container(
                  height: 400,
                  width: 300,
                  child: ListView(
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Title'),
                        ),
                        textInputAction: TextInputAction.next,
                        initialValue: editProduct.title,
                        onSaved: (newValue) {
                          editProduct = Product(
                            title: newValue!, 
                            price: editProduct.price, 
                            imageUrl: editProduct.imageUrl,
                            description: editProduct.description
                          );
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Price'),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        initialValue: editProduct.price.toString(),
                        onSaved: (newValue) {
                          editProduct = Product(
                            title: editProduct.title, 
                            price: double.parse(newValue!), 
                            imageUrl: editProduct.imageUrl,
                            description: editProduct.description
                          );
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Description'),
                        ),
                        maxLines: 3,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.multiline,
                        initialValue: editProduct.description,
                        onSaved: (newValue) {
                          editProduct = Product(
                            title: editProduct.title, 
                            price: editProduct.price, 
                            imageUrl: editProduct.imageUrl,
                            description: newValue!
                          );
                        },
                      ),
                      Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey
                              ),
                            ),
                            child: _imageUrlController.text.isEmpty ? const Text('Enter an image URL') : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Expanded(
                            child: TextFormField(
                              controller: _imageUrlController,
                              decoration: const InputDecoration(
                                label: Text('Image URL'),
                              ),
                              textInputAction: TextInputAction.done,
                              keyboardType: TextInputType.url,
                              onSaved: (newValue) {
                                editProduct = Product(
                                  title: editProduct.title, 
                                  price: editProduct.price, 
                                  imageUrl: newValue!,
                                  description: editProduct.description
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}