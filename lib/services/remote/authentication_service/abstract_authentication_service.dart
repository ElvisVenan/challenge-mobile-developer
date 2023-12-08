import 'package:dartz/dartz.dart';

import '../../../utils/http/errors/application_error.dart';

import '../../../models/authentication_model/authentication_model.dart';
import '../../../models/params/authentication_params/authentication_params.dart';

abstract class AuthenticationService {

  Future<Either<ApplicationError, List<AuthenticationModel>>> getUser(AuthenticationParams? authentication);

  Future<Either<ApplicationError, AuthenticationModel>> getUserById(int id);

}