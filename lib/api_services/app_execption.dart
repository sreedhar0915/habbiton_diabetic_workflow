class AppException implements Exception {
  final String _message;
  final String _prefix;

  AppException(
    this._message,
    this._prefix,
  );

  @override
  String toString() {
    return "$_prefix$_message";
  }
}

class FetchDataException extends AppException {
  FetchDataException({
    required String message,
  }) : super(
          message,
          "Error During Communication: ",
        );
}

class TokenExpired extends AppException {
  TokenExpired(
    super.message,
    super.prefix, {
    required String errormessage,
  });
}

class BadRequestException extends AppException {
  BadRequestException([
    String message = "Bad request",
  ]) : super(
          message,
          "Invalid Request: ",
        );
}

class UnauthorisedException extends AppException {
  UnauthorisedException([
    String message = "Unauthorized access",
  ]) : super(
          message,
          "Unauthorised: ",
        );
}

class InvalidInputException extends AppException {
  InvalidInputException({
    required String message,
  }) : super(
          message,
          "Invalid Input: ",
        );
}

class ValidationException extends AppException {
  ValidationException()
      : super(
          "",
          "",
        );
}

class NotFoundException extends AppException {
  NotFoundException() : super("", "");
}
