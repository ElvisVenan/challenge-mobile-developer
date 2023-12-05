import 'dart:convert';

class AuthenticationModel {
  final String id;
  final String token;
  final String email;
  final String password;
  final String createdAt;

  AuthenticationModel({
    required this.token,
    required this.email,
    required this.password,
    required this.id,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "password": password,
    };
  }

  factory AuthenticationModel.fromMap(Map<String, dynamic> map) {
    return AuthenticationModel(
      id: map['id'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      createdAt: map['createdAt'] as String,
      token: map['token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenticationModel.fromJson(String source) =>
      AuthenticationModel.fromMap(json.decode(source));

  static List<AuthenticationModel> fromListMap(List list) =>
      list.map((e) => AuthenticationModel.fromMap(e)).toList();

  static List<AuthenticationModel> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((e) => AuthenticationModel.fromMap(e))
          .toList();
}
