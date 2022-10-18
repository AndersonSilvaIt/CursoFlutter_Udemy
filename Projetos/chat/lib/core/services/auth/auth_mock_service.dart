import 'dart:async';
import 'dart:math';

import 'package:chat/core/models/chart_user.dart';
import 'dart:io';
import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {
  static Map<String, ChartUser> _users = {};
  static ChartUser? _currentUser;
  static MultiStreamController<ChartUser?>? _controller;

  static final _userStream = Stream<ChartUser?>.multi((controller) {
    _controller = controller;
    _updateUser(null);
  });

  @override
  Stream<ChartUser?> get userChanges {
    return _userStream;
  }

  @override
  ChartUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> signup(
    String name,
    String email,
    String password,
    File image,
  ) async {
    final newUser = ChartUser(
      id: Random().nextDouble().toString(),
      name: name,
      email: email,
      imageURL: image.path,
    );

    _users.putIfAbsent(email, () => newUser);
    _updateUser(newUser);
  }

  @override
  Future<void> login(String email, String password) async {
    _updateUser(_users[email]);
  }

  @override
  Future<void> logout() async {
    _updateUser(null);
  }

  static void _updateUser(ChartUser? user) {
    _currentUser = user;
    _controller?.add(_currentUser);
  }
}
