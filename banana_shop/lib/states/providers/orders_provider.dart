import 'package:banana_shop/states/models/order.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import '../models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  List<Order> _orders = [];

  List<Order> get orders {
    return [..._orders];
  }

  int get itemCount {
    return _orders.length;
  }

  void addItem(List<CartItem> cartProducts, double total) {
    _orders.insert(0, Order(
      id: DateTime.now().toIso8601String(),
      amount: total,
      products: cartProducts,
      dateTime: DateTime.now()
    ));
    notifyListeners();
  }
}