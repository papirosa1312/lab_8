import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://lab13furman.requestcatcher.com',
      contentType: 'text/plain',
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  Future<bool> sendLogin(String email, String password) async {
    try {
      await _dio.post(
        '/login',
        data: jsonEncode({
          'action': 'login',
          'email': email,
          'password': password,
        }),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendSignUp(String name, String email, String password) async {
    try {
      await _dio.post(
        '/signup',
        data: jsonEncode({
          'action': 'signup',
          'name': name,
          'email': email,
          'password': password,
        }),
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> sendResetPassword(String email) async {
    try {
      await _dio.post(
        '/reset-password',
        data: jsonEncode({
          'action': 'reset_password',
          'email': email,
        }),
      );
      return true;
    } catch (e) {
      return false;
    }
  }
}