import 'package:driving_license_exam/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../models/user_models.dart';
import 'exam_service.dart';
import 'study_service.dart';
import 'subscription_service.dart';

class ApiService {
  static final UserService user = UserService();
  static final SubscriptionService subscription = SubscriptionService();
  static final StudyService study = StudyService();
  static final ExamService exam = ExamService();
}

// lib/services/storage_service.dart - For storing user tokens and data
class StorageService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';
  static const String _currentExamKey = 'current_exam';

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userKey, json.encode(user.toJson()));
  }

  static Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  static Future<void> saveCurrentExam(String examId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currentExamKey, examId);
  }

  static Future<String?> getCurrentExam() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currentExamKey);
  }

  static Future<void> clearStorage() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }
}
