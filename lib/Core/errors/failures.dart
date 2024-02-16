import 'package:dio/dio.dart';

abstract class Failure {
  String msq;
  Failure({required this.msq});
}

class ServerFailure extends Failure {
  ServerFailure({required super.msq});
  factory ServerFailure.fromDioError(DioException dio) {
    switch (dio.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(msq: 'Connection Timeout With ApiServers');
      case DioExceptionType.sendTimeout:
        return ServerFailure(msq: 'Send Timeout With ApiServers');

      case DioExceptionType.receiveTimeout:
        return ServerFailure(msq: 'Receive Timeout With ApiServers');

      case DioExceptionType.badCertificate:
        return ServerFailure(msq: 'bad Certificate With ApiServers');

      case DioExceptionType.badResponse:
        return ServerFailure.fromRespo(
            dio.response!.statusCode!, dio.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure(msq: 'opps There Was An Eroor');

      case DioExceptionType.connectionError:
        return ServerFailure(msq: 'opps There Was An Eroor');

      case DioExceptionType.unknown:
        if (dio.message!.contains("SocketException")) {
          return ServerFailure(msq: 'No Internet Connection');
        } else {
          return ServerFailure(msq: 'opps There Was An Eroor');
        }
      default:
        return ServerFailure(msq: 'opps There Was An Eroor');
    }
  }
  factory ServerFailure.fromRespo(int statusCode, dynamic respo) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(msq: 'opps There Was An Eroor');
    } else if (statusCode == 404) {
      return ServerFailure(msq: 'Your Request Not Found , Try Later !');
    } else if (statusCode == 500) {
      return ServerFailure(msq: 'Internet Server Error , Try Later ! ');
    } else {
      return ServerFailure(msq: 'opps There Was An Eroor');
    }
  }
}
