import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  static const _url =
      'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDPryFstQ4phLu93NYZP_wANcfJyicluiM ';

  Future<void> _authenticate(String email, String pass, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDPryFstQ4phLu93NYZP_wANcfJyicluiM';

    final response = http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': pass,
        'returnSecureToken': true,
      }),
    );

    print(response);
  }

  Future<void> signup(String email, String pass) async {

    _authenticate(email, pass, 'signUp');

  }

  Future<void> login(String email, String pass) async {

    _authenticate(email, pass, 'signInWithPassword');

  }  
}
