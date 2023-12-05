import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../const/app_strings.dart';

import '../../../utils/http/errors/application_error.dart';
import '../../../utils/http/errors/authentication_error.dart';
import '../../../utils/http/errors/generic_error.dart';
import '../../../utils/http/mixins/uri_builder.dart';

import '../../../models/authentication_model/authentication_model.dart';
import '../../../models/params/authentication_params/authentication_params.dart';
import '../../endpoints/app_endpoints.dart';

import 'authentication_service.dart';

class AuthenticationServiceImpl
    with UriBuilder
    implements AuthenticationService {
  AuthenticationServiceImpl(this.httpClient);

  final http.Client httpClient;

  @override
  Future<Either<ApplicationError, AuthenticationModel>> createUser(
      AuthenticationParams? authentication) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.authenticateEndpoint,
    );

    try {
      final response = await httpClient.post(
        Uri.parse(url),
        body: {
          'email': authentication?.email,
          'password': authentication?.password,
        },
      );

      if (response.statusCode == 201) {
        final data = response.body;
        return Right(AuthenticationModel.fromJson(data));
      } else if (response.statusCode == 400) {
        return Left(AuthenticationError(
            friendlyMessage: AppStrings.authenticationFailureMessageString,
            causedBy: AppStrings.clientMessageString,
            additionalInfo:
                '${AppStrings.statusCodeMessageString}: ${response.statusCode}'));
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
  Future<Either<ApplicationError, AuthenticationModel>> getUser(int id) async {
    final String url = mountUrl(
      AppEndpoints.baseUrlProtocolWithSecurity,
      AppEndpoints.mainBaseUrl,
      AppEndpoints.authenticateEndpoint,
    );

    try {
      final response = await httpClient.get(
        Uri.parse("$url/$id"),
      );

      if (response.statusCode == 200) {
        final data = response.body;
        return Right(AuthenticationModel.fromJson(data));
      } else if (response.statusCode == 400) {
        return Left(AuthenticationError(
            friendlyMessage: AppStrings.authenticationFailureMessageString,
            causedBy: AppStrings.clientMessageString,
            additionalInfo:
                '${AppStrings.statusCodeMessageString}: ${response.statusCode}'));
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
}
