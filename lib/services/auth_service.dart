import '../models/user_models.dart';
import 'api_config.dart';
import 'api_service.dart';
import 'user_service.dart';

class AuthService {
  static Future<ApiResponse<LoginResponse>> login({
    required String email,
    required String password,
  }) async {
    final response = await UserService.loginUser(
      email: email,
      password: password,
    );

    if (response.success && response.data != null) {
      await StorageService.saveToken(response.data!.token);
      await StorageService.saveUser(response.data!.user);
    }

    return response;
  }

  static Future<ApiResponse<User>> register({
    required String email,
    required String password,
    required String name,
    String? dateOfBirth,
  }) async {
    return await UserService.registerUser(
      email: email,
      password: password,
      name: name,
      dateOfBirth: dateOfBirth,
    );
  }

  static Future<void> logout() async {
    await StorageService.clearStorage();
  }

  static Future<bool> isLoggedIn() async {
    return await StorageService.isLoggedIn();
  }

  static Future<User?> getCurrentUser() async {
    return await StorageService.getUser();
  }

  static Future<String?> getAuthToken() async {
    return await StorageService.getToken();
  }
}
