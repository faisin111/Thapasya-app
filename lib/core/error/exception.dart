class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

class ServerException extends ApiException {
  ServerException() : super("Server no react");
}

class NetworkException extends ApiException {
  NetworkException() : super("Network Failed");
}

class UnknownException extends ApiException {
  UnknownException() : super("Something went wrong");
}

class UnauthorizedException extends ApiException {
  UnauthorizedException() : super("Session expired");
}

class NotFoundException extends ApiException {
  NotFoundException() : super("Data not found");
}

class TimeoutException extends ApiException {
  TimeoutException() : super("Request time out");
}
