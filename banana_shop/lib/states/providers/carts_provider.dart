import 'package:flutter/material.dart';

import '../models/cart_item.dart';


class CartProvider with ChangeNotifier {

  Map<String, CartItem> _carts = {};


  Map<String, CartItem> get carts {
    return {..._carts};
  }

  int get itemCount {
    return _carts.length;
  }

  double get totalAmount {
    var total = 0.0;
    _carts.forEach((key, cartItem) {
      total += cartItem.quantity * cartItem.price;
    });
    return total;
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

  void removeItem(String productId) {
    _carts.remove(productId);
    notifyListeners();
  }

  void clear() {
    _carts = {};
    notifyListeners();
  }
}