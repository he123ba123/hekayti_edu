import 'package:dio/dio.dart';

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://malaz.runasp.net/Auth',
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  );

  Future<Map<String, dynamic>> register({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _dio.post(
        '/register',
        data: {
          'userName': userName,
          'email': email,
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );

      // Normalize the response
      return {
        'success': response.data['success'] == true,
        'data': response.data,
        'errorMessages': response.data['errorMessages'] ?? [],
      };
    } on DioError catch (e) {
      final errorData = e.response?.data;
      List<String> messages = [];
      if (errorData != null) {
        if (errorData is Map && errorData['errorMessages'] is List) {
          messages = List<String>.from(errorData['errorMessages']);
        } else if (errorData is String) {
          messages = [errorData];
        }
      }

      return {
        'success': false,
        'data': null,
        'errorMessages': messages.isNotEmpty ? messages : [e.message],
      };
    }
  }

  Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return {
        'success': response.data['success'] == true,
        'data': response.data,
        'errorMessages': response.data['errorMessages'] ?? [],
      };
    } on DioError catch (e) {
      final errorData = e.response?.data;
      List<String> messages = [];
      if (errorData != null) {
        if (errorData is Map && errorData['errorMessages'] is List) {
          messages = List<String>.from(errorData['errorMessages']);
        } else if (errorData is String) {
          messages = [errorData];
        }
      }
      return {
        'success': false,
        'data': null,
        'errorMessages': messages.isNotEmpty ? messages : [e.message],
      };
    }
  }
}
