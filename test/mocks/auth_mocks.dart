import 'package:challenge_mobile_developer/models/authentication_model/authentication_model.dart';
import 'package:challenge_mobile_developer/models/params/authentication_params/authentication_params.dart';

const authJsonStringMock =
    '{"id": "1", "email": "test@example.com", "password": "password123", "createdAt": "2022-01-01T12:00:00Z", "token": "xyz123"}';

final authParams = AuthenticationParams(
  email: "test@example.com",
  password: "password123",
);

final authModel = AuthenticationModel(
  token: 'xyz123',
  email: "test@example.com",
  password: "password123",
  id: "1",
  createdAt: "2022-01-01T12:00:00Z",
);
