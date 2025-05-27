class ApiConfig {
  static const String baseUrl = 'http://88.222.215.134:3000'; // API Gateway URL
  static const String userBaseUrl = '$baseUrl/api';
  static const String subscriptionBaseUrl = '$baseUrl/sub/api';
  static const String studyBaseUrl = '$baseUrl/study/api';
  static const String examBaseUrl = '$baseUrl/exams/api';

  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
}

// lib/models/api_response.dart
class ApiResponse<T> {
  final bool success;
  final T? data;
  final String message;
  final String? error;

  ApiResponse({
    required this.success,
    this.data,
    this.message = '',
    this.error,
  });

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, T Function(dynamic)? fromJson) {
    return ApiResponse<T>(
      success: json['success'] ?? false,
      data: json['data'] != null && fromJson != null
          ? fromJson(json['data'])
          : json['data'],
      message: json['message'] ?? '',
      error: json['error'],
    );
  }
}
