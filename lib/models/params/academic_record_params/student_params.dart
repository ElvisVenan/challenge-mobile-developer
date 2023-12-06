class StudentParams {
  final String? id;
  final String ra;
  final String name;
  final String email;
  final String dateOfBirth;
  final String cpf;

  StudentParams({
    this.id,
    required this.ra,
    required this.name,
    required this.email,
    required this.dateOfBirth,
    required this.cpf,
  });
}
