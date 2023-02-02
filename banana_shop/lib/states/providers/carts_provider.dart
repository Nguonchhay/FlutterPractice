import 'package:flutter/material.dart';

import '../models/cart_item.dart';


class CartProvider with ChangeNotifier {

  Map<String, CartItem> _carts = [];


  Map<String, CartItem> get carts {
    return [..._carts];
  }

  void addItem(String productId, String productTitle, double productPrice) {
    if (_carts.containsKey(productId)) {
      _carts.update(productId, (existItem) => CartItem(
        id: existItem.id, 
        title: existItem.title, 
        quantity: existItem.quantity + 1, 
        price: existItem.price
      ));
    } else {
      _carts.putIfAbsent(productId, () => CartItem(
        id: DateTime.now().toIso8601String(), 
        title: productTitle, 
        quantity: 1, 
        price: productPrice
      ));
    }
    notifyListeners();
  }

}