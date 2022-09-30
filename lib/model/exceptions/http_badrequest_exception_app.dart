import 'package:calculadora_global/model/exceptions/exception_app.dart';

class HttpBadRequestExceptionApp extends ExceptionApp {
  final statusCode = 400;
  final statusMessage = 'Bad Request';
  HttpBadRequestExceptionApp(String? message, {String? details = ''}) : super(message, details: details);
}
