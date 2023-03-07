import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {

  static const API_KEY = 'AIzaSyD2XkVInwuwC8et4l-2bE1IBl_zdv6hLhk';

  static Future<http.Response> signUp(String email, String password) {
    const signUpURL = 'identitytoolkit.googleapis.com';
    return http.post(
      Uri(
        scheme: 'https',
        host: signUpURL, 
        path: '/v1/accounts:signUp?key=$API_KEY'
      ),
      body: json.encode({
        "email": email,
        "password": password,
        "returnSecureToken": true
      })
    );
  }
}