import 'app_exception.dart';

class FetchDataException extends AppException {
  FetchDataException({String? message})
      : super(
          message: message,
          prefix: "Error during communication",
        );
}

class BadRequestException extends AppException {
  BadRequestException({String? message})
      : super(
          message: message,
          prefix: "Invalid Request",
        );
}

class ServerErrorException extends AppException {
  ServerErrorException({String? message})
      : super(
          message: message,
          prefix: "Server Error",
        );
}
