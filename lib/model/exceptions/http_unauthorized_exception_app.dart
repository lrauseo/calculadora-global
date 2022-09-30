import 'package:calculadora_global/model/exceptions/exception_app.dart';

class HttpUnauthorizedExceptionApp extends ExceptionApp {
  final statusCode = 401;
  final statusMessage = 'Unauthorized';
  HttpUnauthorizedExceptionApp(String? message) : super(message);
}
