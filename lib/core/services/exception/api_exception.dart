import 'package:dio/dio.dart';

class ApiExceptions implements Exception {
  late String message;

  ApiExceptions(this.message);

  static ApiExceptions fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        return ApiExceptions("Request to API server was cancelled");
      case DioExceptionType.connectionTimeout:
        return ApiExceptions("Connection timeout with API server");
      case DioExceptionType.receiveTimeout:
        return ApiExceptions("Receive timeout in connection with API server");
      case DioExceptionType.sendTimeout:
        return ApiExceptions("Send timeout in connection with API server");
      case DioExceptionType.badResponse:
        return ApiExceptions(_handleError(
          dioError.response?.statusCode,
          dioError.response?.data,
        ));
      case DioExceptionType.unknown:
        if (dioError.message != null && dioError.message!.contains("SocketException")) {
          return ApiExceptions('Oops, No Internet');
        } else {
          return ApiExceptions(_handleError(
            dioError.response?.statusCode,
            dioError.response?.data,
          ));
        }
      default:
        return ApiExceptions("Unknown DioExceptionType: ${dioError.type}");
    }
  }

  static String _handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 500:
        return "Internal server error";

      default:
        return error['message'];
    }

    // switch (statusCode) {
    //   case 400:
    //     return 'Bad request';
    //   case 401:
    //     return 'Unauthorized';
    //   case 403:
    //     return 'Forbidden';
    //   case 404:
    //     return error['message'];
    //   case 422:
    //     return error['message'];
    //   case 500:
    //     return 'Internal server error';
    //   case 502:
    //     return 'Bad gateway';
    //   default:
    //     return 'Oops something went wrong';
    // }
  }

  @override
  String toString() => message;
}
