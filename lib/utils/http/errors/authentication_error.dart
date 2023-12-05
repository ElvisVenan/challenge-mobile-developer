import 'application_error.dart';

class AuthenticationError extends ApplicationError {
  AuthenticationError({
    required String friendlyMessage,
    String? causedBy,
    String? fingerprint,
    String? additionalInfo,
}) : super(
    friendlyMessage: friendlyMessage,
    causedBy: causedBy,
    fingerprint: fingerprint,
    additionalInfo: additionalInfo,
  );

  @override
  String get name => '$AuthenticationError';
}