import '../models/exam_models.dart';
import '../models/study_models.dart';
import 'api_config.dart';
import 'http_service.dart';

class ExamService {
  static Future<ApiResponse<List<VehicleType>>> getUserLicenses(
      String userId) async {
    final response = await HttpService.get(
        '${ApiConfig.examBaseUrl}/mock-exam/user/$userId/licenses');
    return ApiResponse.fromJson(
      response,
      (data) => (data as List)
          .map((license) => VehicleType.fromJson(license))
          .toList(),
    );
  }

  static Future<ApiResponse<MockExam>> startMockExam({
    required String userId,
    String language = 'en',
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.examBaseUrl}/mock-exam/start',
      body: {
        'user_id': userId,
        'language': language,
      },
    );
    return ApiResponse.fromJson(response, (data) => MockExam.fromJson(data));
  }

  static Future<ApiResponse<List<ExamQuestion>>> getExamQuestions(
      String examId) async {
    final response = await HttpService.get(
        '${ApiConfig.examBaseUrl}/mock-exam/$examId/questions');
    return ApiResponse.fromJson(
      response,
      (data) => (data['questions'] as List)
          .map((q) => ExamQuestion.fromJson(q))
          .toList(),
    );
  }

  static Future<ApiResponse<Map<String, dynamic>>> submitExamAnswer({
    required String examId,
    required int questionId,
    required int selectedOption,
    int? timeTakenSeconds,
  }) async {
    final response = await HttpService.post(
      '${ApiConfig.examBaseUrl}/mock-exam/$examId/questions/$questionId/answer',
      body: {
        'selected_option': selectedOption,
        if (timeTakenSeconds != null) 'time_taken_seconds': timeTakenSeconds,
      },
    );
    return ApiResponse.fromJson(response, (data) => data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> submitExam(
      String examId) async {
    final response = await HttpService.post(
        '${ApiConfig.examBaseUrl}/mock-exam/$examId/submit');
    return ApiResponse.fromJson(response, (data) => data);
  }

  static Future<ApiResponse<ExamResult>> getExamResults(String examId) async {
    final response = await HttpService.get(
        '${ApiConfig.examBaseUrl}/mock-exam/$examId/results');
    return ApiResponse.fromJson(response, (data) => ExamResult.fromJson(data));
  }

  static Future<ApiResponse<Map<String, dynamic>>> getExamHistory({
    required String userId,
    int limit = 10,
    int page = 1,
  }) async {
    final response = await HttpService.get(
      '${ApiConfig.examBaseUrl}/mock-exam/user/$userId/history?limit=$limit&page=$page',
    );
    return ApiResponse.fromJson(response, (data) => data);
  }

  static Future<ApiResponse<Map<String, dynamic>>> getExamStatus(
      String examId) async {
    final response = await HttpService.get(
        '${ApiConfig.examBaseUrl}/mock-exam/$examId/status');
    return ApiResponse.fromJson(response, (data) => data);
  }
}
