import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:banana_shop/screens/admins/products/products_screen.dart';
import 'package:banana_shop/states/models/product.dart';
import 'package:banana_shop/states/providers/products_provider.dart';


class ProductNewScreen extends StatefulWidget {
  static const routeName = '/admin-product-new';

  ProductNewScreen({super.key});

  @override
  State<ProductNewScreen> createState() => _ProductNewScreenState();
}

class _ProductNewScreenState extends State<ProductNewScreen> {

  final _imageUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();
  var newProduct = Product(
    id: DateTime.now().toIso8601String(),
    title: '', 
    price: 0, 
    imageUrl: ''
  );


  void _onSaveProduct() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return ;
    }
    _form.currentState?.save();
    Provider.of<ProductsProvider>(context, listen: false).addProduct(newProduct);
    Navigator.of(context).pushNamed(ProductsScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('New Product'),
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please provide a title';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          newProduct = Product(
                            id: newProduct.id,
                            title: newValue!, 
                            price: newProduct.price, 
                            imageUrl: newProduct.imageUrl,
                            description: newProduct.description
                          );
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          label: Text('Price'),
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a price';
                          }
                          if (double.tryParse(value) == null) {
                            return 'Please enter a valid number';
                          }
                          if (double.parse(value) <= 0) {
                            return 'Please enter a number bigger than 0';
                          }
                          return null;
                        },
                        onSaved: (newValue) {
                          newProduct = Product(
                            id: newProduct.id,
                            title: newProduct.title, 
                            price: double.parse(newValue!), 
                            imageUrl: newProduct.imageUrl,
                            description: newProduct.description
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
                        onSaved: (newValue) {
                          newProduct = Product(
                            id: newProduct.id,
                            title: newProduct.title, 
                            price: newProduct.price, 
                            imageUrl: newProduct.imageUrl,
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
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter an image URL';
                                }
                                if (!value.startsWith('http') || !value.startsWith('https')) {
                                  return 'Please enter a valid URL';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                newProduct = Product(
                                  id: newProduct.id,
                                  title: newProduct.title, 
                                  price: newProduct.price, 
                                  imageUrl: newValue!,
                                  description: newProduct.description
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