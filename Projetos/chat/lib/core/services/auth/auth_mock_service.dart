import 'package:chat/core/models/chart_user.dart';
import 'dart:io';
import 'package:chat/core/services/auth/auth_service.dart';

class AuthMockService implements AuthService {

  static Map<String, ChartUser> _users = {};
  static ChartUser? _currentUser;

  @override
  ChartUser? get currentUser {
    return _currentUser;
  }

  @override
  Future<void> login(String email, String password) async {}

  @override
  Future<void> logout() async {}

  @override
  Future<void> signup(
      String nome, String email, String password, File image) async {}

  @override
  Stream<ChartUser?> get userChanges {
    return null;
  }
}
