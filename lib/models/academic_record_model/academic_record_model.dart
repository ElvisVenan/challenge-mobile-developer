import 'dart:convert';

class AcademicRecordModel {
  final String ra;
  final String name;
  final String email;
  final String dateOfBirth;
  final String cpf;

  AcademicRecordModel({
    required this.ra,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.cpf,
  });

  Map<String, dynamic> toMap() {
    return {
      "ra": ra,
      "name": name,
      "email": email,
      "dateOfBirth": dateOfBirth,
      "cpf": cpf,
    };
  }

  factory AcademicRecordModel.fromMap(Map<String, dynamic> map) {
    return AcademicRecordModel(
      ra: map['ra'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      cpf: map['cpf'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AcademicRecordModel.fromJson(String source) =>
      AcademicRecordModel.fromMap(json.decode(source));

  static List<AcademicRecordModel> fromListMap(List list) =>
      list.map((e) => AcademicRecordModel.fromMap(e)).toList();

  static List<AcademicRecordModel> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((e) => AcademicRecordModel.fromMap(e))
          .toList();

}
