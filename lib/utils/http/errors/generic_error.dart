import '../../../const/app_strings.dart';
import 'application_error.dart';

/// Uma [ApplicationError] cuja mensagem para o usuário é genérica.
class GenericError extends ApplicationError {
  GenericError({
    causedBy,
    fingerprint,
    additionalInfo,
  }) : super(
    friendlyMessage: AppStrings.genericErrorMessage,
    causedBy: causedBy,
    fingerprint: fingerprint,
    additionalInfo: additionalInfo,
  );

  @override
  String get name => '$GenericError';
}
