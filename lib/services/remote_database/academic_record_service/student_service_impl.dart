import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../const/app_strings.dart';

import '../../../utils/http/errors/application_error.dart';
import '../../../utils/http/errors/authentication_error.dart';
import '../../../utils/http/errors/generic_error.dart';
import '../../../utils/http/mixins/uri_builder.dart';

import '../../../models/params/academic_record_params/student_params.dart';
import '../../../models/student_models/student_model.dart';

import '../../endpoints/app_endpoints.dart';

import 'student_service.dart';

class StudentServiceImpl
    with UriBuilder
    implements StudentService {
  StudentServiceImpl(this.httpClient);

  final http.Client httpClient;

  @override
  Future<Either<ApplicationError, StudentModel>> createStudent(
      StudentParams academicRecord) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.studentEndpoint,
    );

    try {
      final response = await httpClient.post(
        Uri.parse(url),
        body: {
          "ra": academicRecord.ra,
          "name": academicRecord.name,
          "email": academicRecord.email,
          "dateOfBirth": academicRecord.dateOfBirth,
          "cpf": academicRecord.cpf,
        },
      );

      if (response.statusCode == 201) {
        final data = response.body;
        return Right(StudentModel.fromJson(data));
      } else if (response.statusCode == 500) {
        return Left(AuthenticationError(
            friendlyMessage: AppStrings.serviceErrorMessageString,
            causedBy: AppStrings.serviceMessageString,
            additionalInfo:
                '${AppStrings.statusCodeMessageString}: ${response.statusCode}'));
      } else {
        return Left(
            GenericError(causedBy: AppStrings.unknownCauseMessageString));
      }
    } catch (e) {
      return Left(AuthenticationError(
          friendlyMessage: e.toString(), additionalInfo: e.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, StudentModel>> deleteStudent(int id) {
    // TODO: implement deleteAcademicRecord
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, List<StudentModel>>> getStudents() async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.studentEndpoint,
    );

    try {
      final response = await httpClient.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        final List<StudentModel> students = StudentModel.fromListMap(data);
        return Right(students);
      } else if (response.statusCode == 500) {
        return Left(AuthenticationError(
            friendlyMessage: AppStrings.serviceErrorMessageString,
            causedBy: AppStrings.serviceMessageString,
            additionalInfo:
                '${AppStrings.statusCodeMessageString}: ${response.statusCode}'));
      } else {
        return Left(
            GenericError(causedBy: AppStrings.unknownCauseMessageString));
      }
    } catch (e) {
      return Left(AuthenticationError(
          friendlyMessage: e.toString(), additionalInfo: e.toString()));
    }
  }

  @override
  Future<Either<ApplicationError, StudentModel>> getStudentById(int id) {
    // TODO: implement getRecordAcademicById
    throw UnimplementedError();
  }

  @override
  Future<Either<ApplicationError, StudentModel>> updateStudent(
      StudentParams academicRecord) {
    // TODO: implement updateRecordAcademic
    throw UnimplementedError();
  }
}
