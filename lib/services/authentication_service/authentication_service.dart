import 'package:dartz/dartz.dart';

import '../../models/params/authentication_params/authentication_params.dart';
import '../../utils/http/errors/application_error.dart';

import '../../models/authentication_model/authentication_model.dart';

abstract class AuthenticationService {

  @override
  Future<Either<ApplicationError, AuthenticationModel>> authentication(AuthenticationParams? authentication);

}