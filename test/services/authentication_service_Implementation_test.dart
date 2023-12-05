import 'package:dartz/dartz.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import 'package:challenge_mobile_developer/utils/http/errors/application_error.dart';
import 'package:challenge_mobile_developer/models/authentication_model/authentication_model.dart';
import 'package:challenge_mobile_developer/services/authentication_service/authentication_service_Implementation.dart';

import '../mocks/auth_mocks.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  group('AuthenticationServiceImpl', () {
    late AuthenticationServiceImpl authenticationService;
    late MockHttpClient mockHttpClient;

    setUp(() {
      mockHttpClient = MockHttpClient();
      authenticationService = AuthenticationServiceImpl(mockHttpClient);
      registerFallbackValue(Uri.parse(''));
    });

    void successMock() {
      when(() => mockHttpClient.post(any(), body: any(named: 'body')))
          .thenAnswer((_) async => http.Response(authJsonStringMock, 201));
    }

    void errorMock(int statusCode) {
      when(() => mockHttpClient.post(any()))
          .thenAnswer((_) async => http.Response('', statusCode));
    }

    test('should call the post method with correct params', () async {
      // Arrange
      successMock();

      // Act
      await authenticationService.createUser(authParams);

      // Assert
      final capturedRequestBody = verify(() => mockHttpClient.post(
            any(),
            body: captureAny(named: 'body'),
          )).captured.single as Map<String, dynamic>;

      expect(capturedRequestBody['email'], equals('test@example.com'));
      expect(capturedRequestBody['password'], equals('password123'));
    });

    test('should return a authModelMock when the call is successful', () async {
      // Arrange
      successMock();

      // Act
      final result = await authenticationService.createUser(authParams);

      // Assert
      expect(result, isA<Right<ApplicationError, AuthenticationModel>>());

      final authModelResult =
          (result as Right<ApplicationError, AuthenticationModel>).value;

      expect(authModelResult.token, equals(authModel.token));
      expect(authModelResult.email, equals(authModel.email));
      expect(authModelResult.password, equals(authModel.password));
      expect(authModelResult.id, equals(authModel.id));
      expect(authModelResult.createdAt, equals(authModel.createdAt));
    });

    test(
        'should return a Left<AuthenticationError, AuthenticationModel> when the call is unsuccessfully',
        () async {
      // Arrange
      errorMock(500);

      // Act
      final result = await authenticationService.createUser(authParams);

      // Assert
      expect(result, isA<Left>());
    });
  });
}
