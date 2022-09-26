import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/exceptions/auth_exception.dart';

class Auth with ChangeNotifier {
  String? _token;
  String? _email;
  String? _uid;
  DateTime? _expiresDate;

  bool get isAuth {
    final isValid = _expiresDate?.isAfter(DateTime.now()) ?? false;
    return _token != null && isValid;
  }

  String? get token {
    return isAuth ? _token : null;
  }

  String? get email {
    return isAuth ? _email : null;
  }

  String? get uid {
    return isAuth ? _uid : null;
  }

  Future<void> _authenticate(
      String email, String pass, String urlFragment) async {
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlFragment?key=AIzaSyDPryFstQ4phLu93NYZP_wANcfJyicluiM';

    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode({
        'email': email,
        'password': pass,
        'returnSecureToken': true,
      }),
    );

    final body = jsonDecode(response.body);

    if (body['error'] != null) {
      throw AuthException(body['error']['message']);
    } else {
      _token = body['idToken'];
      _email = body['email'];
      _uid = body['localid'];

      _expiresDate = DateTime.now().add(
        Duration(
          seconds: int.parse(body['expiresInd']),
        ),
      );
      notifyListeners();
    }
  }

  Future<void> signup(String email, String pass) async {
    return _authenticate(email, pass, 'signUp');
  }

  Future<void> login(String email, String pass) async {
    return _authenticate(email, pass, 'signInWithPassword');
  }
}
