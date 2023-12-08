import 'package:dartz/dartz.dart';

import '../../../models/student_models/student_model.dart';
import '../../../utils/http/errors/application_error.dart';

import '../../../models/params/academic_record_params/student_params.dart';

abstract class StudentService {

  Future<Either<ApplicationError, StudentModel>> createStudent(StudentParams academicRecord);

  Future<Either<ApplicationError, List<StudentModel>>> getStudents();

  Future<Either<ApplicationError, StudentModel>> deleteStudent(int id);

  Future<Either<ApplicationError, StudentModel>> getStudentById(int id);

  Future<Either<ApplicationError, StudentModel>> updateStudent(StudentModel studentModel);

}