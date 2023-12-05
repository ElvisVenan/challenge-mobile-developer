import 'package:dartz/dartz.dart';

import '../../utils/http/errors/application_error.dart';

import '../../models/params/authentication_params/authentication_params.dart';
import '../../models/authentication_model/authentication_model.dart';

abstract class AuthenticationService {

  @override
  Future<Either<ApplicationError, AuthenticationModel>> createUser(AuthenticationParams? authentication);

  @override
  Future<Either<ApplicationError, AuthenticationModel>> getUser(int id);

}