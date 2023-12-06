import 'dart:convert';

class StudentModel {
  final String id;
  final String name;
  final String email;
  final String birthdate;
  final String academicRecord;
  final String cpf;
  final String createdAt;

  StudentModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.birthdate,
      required this.cpf,
      required this.createdAt,
      required this.academicRecord});

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "email": email,
      "birthdate": birthdate,
      "cpf": cpf,
    };
  }

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      birthdate: map['birthdate'].toString(),
      cpf: map['cpf'].toString(),
      createdAt: map['createdAt'] as String,
      academicRecord: map['academic_record'].toString(),
    );
  }

  String toJson() => json.encode(toMap());

  factory StudentModel.fromJson(String source) =>
      StudentModel.fromMap(json.decode(source));

  static List<StudentModel> fromListMap(List list) =>
      list.map((e) => StudentModel.fromMap(e)).toList();

  static List<StudentModel> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((e) => StudentModel.fromMap(e))
          .toList();
}
