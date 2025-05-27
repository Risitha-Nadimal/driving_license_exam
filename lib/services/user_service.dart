import 'dart:io';

import '../models/user_models.dart';
import 'api_config.dart';
import 'http_service.dart';

class UserService {
  static Future<ApiResponse<List<User>>> getAllUsers() async {
    final response = await HttpService.get('${ApiConfig.userBaseUrl}/users');
    return ApiResponse.fromJson(
      response,
      (data) => (data as List).map((user) => User.fromJson(user)).toList(),
    );
  }

  static Future<ApiResponse<User>> registerUser({
    required String email,
    required String password,
    required String name,
    String? dateOfBirth,
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.userBaseUrl}/users/register',
      body: {
        'email': email,
        'password': password,
        'name': name,
        if (dateOfBirth != null) 'dateOfBirth': dateOfBirth,
      },
    );
    return ApiResponse.fromJson(response, (data) => User.fromJson(data));
  }

  static Future<ApiResponse<LoginResponse>> loginUser({
    required String email,
    required String password,
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.userBaseUrl}/users/login',
      body: {
        'email': email,
        'password': password,
      },
    );
    return ApiResponse.fromJson(
        response, (data) => LoginResponse.fromJson(data));
  }

  static Future<ApiResponse<User>> getUserById(String userId) async {
    final response =
        await HttpService.get('${ApiConfig.userBaseUrl}/users/$userId');
    return ApiResponse.fromJson(response, (data) => User.fromJson(data));
  }

  static Future<ApiResponse<User>> updateUser({
    required String userId,
    String? name,
    String? dateOfBirth,
    String? password,
  }) async {
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (dateOfBirth != null) body['dateOfBirth'] = dateOfBirth;
    if (password != null) body['password'] = password;

    final response = await HttpService.put(
      '${ApiConfig.userBaseUrl}/users/$userId',
      body: body,
    );
    return ApiResponse.fromJson(response, (data) => User.fromJson(data));
  }

  static Future<ApiResponse<User>> updateUserByEmail({
    required String email,
    String? name,
    String? dateOfBirth,
    String? password,
  }) async {
    final body = <String, dynamic>{};
    if (name != null) body['name'] = name;
    if (dateOfBirth != null) body['dateOfBirth'] = dateOfBirth;
    if (password != null) body['password'] = password;

    final response = await HttpService.put(
      '${ApiConfig.userBaseUrl}/users/email/$email',
      body: body,
    );
    return ApiResponse.fromJson(response, (data) => User.fromJson(data));
  }

  static Future<ApiResponse<User>> uploadProfilePhoto({
    required String userId,
    required File photoFile,
  }) async {
    final response = await HttpService.multipartPost(
      '${ApiConfig.userBaseUrl}/users/$userId/profile-photo',
      {},
      photoFile,
      fileField: 'photo',
    );
    return ApiResponse.fromJson(
        response, (data) => User.fromJson(data['user']));
  }
}
