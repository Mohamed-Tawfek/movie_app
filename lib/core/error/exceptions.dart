import '../network/error_message_model.dart';

class ServerError implements Exception {
  ErrorMessageModel errorMessageModel;
  ServerError({required this.errorMessageModel});

}

class LocalDatabaseError implements Exception {
  String message;

  LocalDatabaseError(this.message);
}
