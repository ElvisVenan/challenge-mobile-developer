import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:challenge_mobile_developer/models/authentication_model/authentication_model.dart';

import '../mocks/auth_mocks.dart';

void main() {

  group('AuthenticationModel', () {

    test('toJson should work correctly', () {

      final jsonString = authModel.toJson();
      final decodedMap = AuthenticationModel.fromMap(json.decode(jsonString));

      expect(decodedMap.id, '1');
      expect(decodedMap.email, 'test@example.com');
      expect(decodedMap.password, 'password123');
      expect(decodedMap.createdAt, '2022-01-01T12:00:00Z');
      expect(decodedMap.token, 'xyz123');
    });

    test('fromJson should work correctly', () {

      final decodedModel = AuthenticationModel.fromJson(authJsonStringMock);

      expect(decodedModel.id, '1');
      expect(decodedModel.email, 'test@example.com');
      expect(decodedModel.password, 'password123');
      expect(decodedModel.createdAt, '2022-01-01T12:00:00Z');
      expect(decodedModel.token, 'xyz123');
    });
  });

}
