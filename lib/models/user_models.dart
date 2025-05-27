class User {
  final String id;
  final String email;
  final String name;
  final String? dateOfBirth;
  final String? profilePhotoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  User({
    required this.id,
    required this.email,
    required this.name,
    this.dateOfBirth,
    this.profilePhotoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      dateOfBirth: json['date_of_birth'],
      profilePhotoUrl: json['profile_photo_url'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'date_of_birth': dateOfBirth,
      'profile_photo_url': profilePhotoUrl,
    };
  }
}

class LoginResponse {
  final User user;
  final String token;

  LoginResponse({required this.user, required this.token});

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }
}
