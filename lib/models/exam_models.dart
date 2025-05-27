import 'study_models.dart';

class MockExam {
  final String examId;
  final int totalQuestions;
  final int timeLimitMinutes;
  final String language;
  final int vehicleTypeId;
  final List<int> accessibleVehicleTypes;
  final DateTime startedAt;

  MockExam({
    required this.examId,
    required this.totalQuestions,
    required this.timeLimitMinutes,
    required this.language,
    required this.vehicleTypeId,
    required this.accessibleVehicleTypes,
    required this.startedAt,
  });

  factory MockExam.fromJson(Map<String, dynamic> json) {
    return MockExam(
      examId: json['exam_id'],
      totalQuestions: json['total_questions'],
      timeLimitMinutes: json['time_limit_minutes'],
      language: json['language'],
      vehicleTypeId: json['vehicle_type_id'],
      accessibleVehicleTypes: List<int>.from(json['accessible_vehicle_types']),
      startedAt: DateTime.parse(json['started_at']),
    );
  }
}

class ExamQuestion {
  final int questionOrder;
  final int id;
  final String questionText;
  final List<QuestionOption> options;
  final String categoryName;
  final String lessonTitle;
  final String? imageUrl;
  final String? questionAudio;
  final int? questionAudioDuration;

  ExamQuestion({
    required this.questionOrder,
    required this.id,
    required this.questionText,
    required this.options,
    required this.categoryName,
    required this.lessonTitle,
    this.imageUrl,
    this.questionAudio,
    this.questionAudioDuration,
  });

  factory ExamQuestion.fromJson(Map<String, dynamic> json) {
    return ExamQuestion(
      questionOrder: json['question_order'],
      id: json['id'],
      questionText: json['question_text'],
      options: (json['options'] as List)
          .map((option) => QuestionOption.fromJson(option))
          .toList(),
      categoryName: json['category_name'],
      lessonTitle: json['lesson_title'],
      imageUrl: json['image_url'],
      questionAudio: json['question_audio'],
      questionAudioDuration: json['question_audio_duration'],
    );
  }
}

class ExamResult {
  final String examId;
  final double scorePercentage;
  final int correctAnswers;
  final int wrongAnswers;
  final int totalQuestions;
  final bool passed;
  final String grade;
  final int examDurationMinutes;
  final String vehicleType;
  final String language;
  final DateTime startedAt;
  final DateTime completedAt;

  ExamResult({
    required this.examId,
    required this.scorePercentage,
    required this.correctAnswers,
    required this.wrongAnswers,
    required this.totalQuestions,
    required this.passed,
    required this.grade,
    required this.examDurationMinutes,
    required this.vehicleType,
    required this.language,
    required this.startedAt,
    required this.completedAt,
  });

  factory ExamResult.fromJson(Map<String, dynamic> json) {
    return ExamResult(
      examId: json['exam_id'],
      scorePercentage: json['score_percentage'].toDouble(),
      correctAnswers: json['correct_answers'],
      wrongAnswers: json['wrong_answers'],
      totalQuestions: json['total_questions'],
      passed: json['passed'],
      grade: json['grade'],
      examDurationMinutes: json['exam_duration_minutes'],
      vehicleType: json['vehicle_type'],
      language: json['language'],
      startedAt: DateTime.parse(json['started_at']),
      completedAt: DateTime.parse(json['completed_at']),
    );
  }
}
