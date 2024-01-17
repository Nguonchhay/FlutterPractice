import 'package:flutter/material.dart';
import 'package:widget_demo/models/user.dart';

class AuthProvider extends ChangeNotifier {

  User? _user;
  final List<User> _users = [];

  User get user => _user!;

  List<User> get users => _users;

  set user (User user) {
    _user = user;
    notifyListeners();
  }

  void addUser(User user) {
    _users.add(user);
    notifyListeners();
  }
}