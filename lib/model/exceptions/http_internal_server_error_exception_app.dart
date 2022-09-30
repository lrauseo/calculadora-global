import 'package:calculadora_global/model/exceptions/exception_app.dart';

class HttpInternalServerErrorApp extends ExceptionApp {
  final statusCode = 500;
  final statusMessage = 'Internal Server Error';
  HttpInternalServerErrorApp(String? message, {String? details = ''}) : super(message, details: details);
}
