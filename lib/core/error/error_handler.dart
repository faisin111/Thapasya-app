import 'package:dio/dio.dart';
import 'package:thapasya/core/error/exception.dart';

class ErrorHandler {
  static ApiException handlerAuth(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
     return ApiException("Request time out");
    }
  if (e.type == DioExceptionType.connectionError) return NetworkException();
    switch (e.response?.statusCode) {
      case 400:
        return ApiException('Invalid email or password');

      case 401:
        return ApiException('Invalid email or password');

      case 403:
        return  ApiException('Access denied');
      case 404:
       return ApiException('Data not found');

      case 500:
        return ApiException('Server error. Try again later');

      case 503:
        return ApiException("Service unavailable.");

      case 504:
        return ApiException('Server timeout. Please try again');
      default:
        return ApiException('Something went wrong');
    }
  }

  static ApiException handlerData(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.type == DioExceptionType.sendTimeout) {
      return TimeoutException();
    }
    if (e.type == DioExceptionType.connectionError) throw NetworkException();
    switch (e.response?.statusCode) {
      case 401:
        return UnauthorizedException();

      case 404:
        return NotFoundException();

      case 500:
        return ServerException();

      default:
        return UnknownException();
    }
  }
}
