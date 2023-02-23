import 'dart:convert';
import 'package:banana_shop/states/models/product.dart';
import 'package:http/http.dart' as http;


class ProductService {

  static const BASE_URL = 'flutter-banana-shop-default-rtdb.asia-southeast1.firebasedatabase.app';

  static Future<http.Response> addProduct(Product product) {
    const storeURL = BASE_URL;
    return http.post(
      Uri(scheme: 'https', host: storeURL, path: '/products.json'),
      body: json.encode(product.toJson())
    );
  }
}