import 'dart:convert';

import 'package:banana_shop/services/auth_service.dart';
import 'package:flutter/material.dart';


class AuthProvider with ChangeNotifier {
  // String _token;
  // DateTime _expiryDate;
  // String _userId;

  Future<void> signUp(String email, String password) async {
    final response = await AuthService.signUp(email, password);
    print(json.decode(response.body));
  }
}