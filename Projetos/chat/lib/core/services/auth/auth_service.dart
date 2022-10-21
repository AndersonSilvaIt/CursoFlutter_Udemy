import 'dart:io';
import 'package:chat/core/models/chart_user.dart';
import 'package:chat/core/services/auth/auth_mock_service.dart';

abstract class AuthService {
  ChartUser? get currentUser;

  Stream<ChartUser?> get userChanges;

  Future<void> signup(
    String name,
    String email,
    String password,
    File? image,
  );
  Future<void> login(String email, String password);
  Future<void> logout();

  factory AuthService(){
    return AuthMockService();
  }
}
