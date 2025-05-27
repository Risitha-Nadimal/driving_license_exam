class VehicleType {
  final int id;
  final String name;
  final String displayName;
  final int hierarchyLevel;

  VehicleType({
    required this.id,
    required this.name,
    required this.displayName,
    required this.hierarchyLevel,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      hierarchyLevel: json['hierarchy_level'],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String displayName;
  final String? iconUrl;
  final int lessonCount;

  Category({
    required this.id,
    required this.name,
    required this.displayName,
    this.iconUrl,
    required this.lessonCount,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      displayName: json['display_name'],
      iconUrl: json['icon_url'],
      lessonCount: json['lesson_count'] ?? 0,
    );
  }
}

class Lesson {
  final int id;
  final String title;
  final String? imageUrl;
  final int categoryId;
  final int lessonOrder;
  final int questionCount;

  Lesson({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.categoryId,
    required this.lessonOrder,
    required this.questionCount,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['id'],
      title: json['title'],
      imageUrl: json['image_url'],
      categoryId: json['category_id'],
      lessonOrder: json['lesson_order'],
      questionCount: json['question_count'] ?? 0,
    );
  }
}

class QuestionOption {
  final int optionNumber;
  final String optionText;
  final int? optionId;
  final String? audioUrl;
  final int? audioDuration;

  QuestionOption({
    required this.optionNumber,
    required this.optionText,
    this.optionId,
    this.audioUrl,
    this.audioDuration,
  });

  factory QuestionOption.fromJson(Map<String, dynamic> json) {
    return QuestionOption(
      optionNumber: json['option_number'],
      optionText: json['option_text'],
      optionId: json['option_id'],
      audioUrl: json['audio_url'],
      audioDuration: json['audio_duration'],
    );
  }
}

class Question {
  final int id;
  final String questionText;
  final int correctOption;
  final String explanation;
  final int vehicleTypeId;
  final String vehicleTypeName;
  final String language;
  final List<QuestionOption> options;
  final String? imageUrl;
  final String? questionAudio;
  final int? questionAudioDuration;

  Question({
    required this.id,
    required this.questionText,
    required this.correctOption,
    required this.explanation,
    required this.vehicleTypeId,
    required this.vehicleTypeName,
    required this.language,
    required this.options,
    this.imageUrl,
    this.questionAudio,
    this.questionAudioDuration,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      id: json['id'],
      questionText: json['question_text'],
      correctOption: json['correct_option'],
      explanation: json['explanation'],
      vehicleTypeId: json['vehicle_type_id'],
      vehicleTypeName: json['vehicle_type_name'],
      language: json['language'],
      options: (json['options'] as List)
          .map((option) => QuestionOption.fromJson(option))
          .toList(),
      imageUrl: json['image_url'],
      questionAudio: json['question_audio'],
      questionAudioDuration: json['question_audio_duration'],
    );
  }
}
