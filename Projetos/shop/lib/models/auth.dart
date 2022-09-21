import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDPryFstQ4phLu93NYZP_wANcfJyicluiM ';

  Future<void> signup(String email, String pass) async {
    final response = await http.post(
      Uri.parse(_url),
      body: jsonEncode({
        'email' : email,
        'password': pass,
        'returnSecureToken': true
      }),
    );

    print(response.body);
  }
}
