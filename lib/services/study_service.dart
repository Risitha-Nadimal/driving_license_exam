import 'package:driving_license_exam/services/api_config.dart';

import '../models/study_models.dart';
import 'http_service.dart';

class StudyService {
  static Future<ApiResponse<List<VehicleType>>> getVehicleTypes() async {
    final response =
        await HttpService.get('${ApiConfig.studyBaseUrl}/user/vehicle-types');
    return ApiResponse.fromJson(
      response,
      (data) =>
          (data as List).map((type) => VehicleType.fromJson(type)).toList(),
    );
  }

  static Future<ApiResponse<List<Category>>> getCategories(
      int vehicleTypeId) async {
    final response = await HttpService.get(
        '${ApiConfig.studyBaseUrl}/user/categories/$vehicleTypeId');
    return ApiResponse.fromJson(
      response,
      (data) => (data as List)
          .map((category) => Category.fromJson(category))
          .toList(),
    );
  }

  static Future<ApiResponse<List<Lesson>>> getLessons({
    required int vehicleTypeId,
    required int categoryId,
  }) async {
    final response = await HttpService.get(
        '${ApiConfig.studyBaseUrl}/user/lessons/$vehicleTypeId/$categoryId');
    return ApiResponse.fromJson(
      response,
      (data) =>
          (data as List).map((lesson) => Lesson.fromJson(lesson)).toList(),
    );
  }

  static Future<ApiResponse<List<Question>>> getQuestions({
    required int lessonId,
    required int vehicleTypeId,
    required String language,
  }) async {
    final response = await HttpService.get(
      '${ApiConfig.studyBaseUrl}/user/lessons/$lessonId/questions/$vehicleTypeId/$language',
    );
    return ApiResponse.fromJson(
      response,
      (data) => (data as List)
          .map((question) => Question.fromJson(question))
          .toList(),
    );
  }

  static Future<ApiResponse<Map<String, dynamic>>> submitAnswer({
    required int questionId,
    required int selectedOption,
    required String sessionId,
    int? timeTaken,
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.studyBaseUrl}/user/questions/$questionId/answer',
      body: {
        'selected_option': selectedOption,
        'session_id': sessionId,
        if (timeTaken != null) 'time_taken': timeTaken,
      },
    );
    return ApiResponse.fromJson(response, (data) => data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> getSessionResults(
      String sessionId) async {
    final response = await HttpService.get(
        '${ApiConfig.studyBaseUrl}/user/session/$sessionId/results');
    return ApiResponse.fromJson(response, (data) => data);
  }
}
