import '../services/api_config.dart';
import '../services/api_service.dart';

class ApiInterceptor {
  static Map<String, String> getAuthHeaders() {
    return {
      ...ApiConfig.headers,
      // Add authorization header if token exists
    };
  }

  static Future<Map<String, String>> getAuthHeadersAsync() async {
    final token = await StorageService.getToken();
    return {
      ...ApiConfig.headers,
      if (token != null) 'Authorization': 'Bearer $token',
    };
  }
}
