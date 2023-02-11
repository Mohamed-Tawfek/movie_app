import '../network/error_message_model.dart';

class ServerError implements Exception{

  ErrorMessageModel errorMessageModel;

  ServerError({required this.errorMessageModel});
}