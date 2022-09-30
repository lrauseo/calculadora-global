import 'dart:convert';

import 'package:calculadora_global/model/exceptions/exception_app.dart';
import 'package:calculadora_global/model/exceptions/http_badrequest_exception_app.dart';
import 'package:calculadora_global/model/exceptions/http_internal_server_error_exception_app.dart';
import 'package:calculadora_global/model/response_resumo_renda_fixa.dart';
import 'package:calculadora_global/model/request_renda_fixa.dart';
import 'package:calculadora_global/repository/renda_fixa_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:http/http.dart' as http;

class RendaFixaRepositoryImpl extends RendaFixaRepository {
  @override
  Future<ResponseResumoRendaFixa?> calcularRendaFixa(RequestRendaFixa rendaFixa) async {
    var uri = Uri.parse("https://calculadora-global.azurewebsites.net/rendafixa");
    try {
      final response = await http.post(uri, body: jsonEncode(rendaFixa.toJson()), headers: {
        'Content-Type': 'application/json',
        'Access-Control-Allow-Headers':
            'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale',
        "Access-Control-Allow-Origin": "*", // Required for CORS support to work
        // "Access-Control-Allow-Credentials": 'true', // Required for cookies, authorization headers with HTTPS

        // "Access-Control-Allow-Methods": "POST, OPTIONS"
      });
      if (response.statusCode == 200) {
        return ResponseResumoRendaFixa.fromJson(jsonDecode(response.body));
      } else
        return null;
    } on DioError catch (error) {
      switch (error.response?.statusCode) {
        case HttpStatus.badRequest:
          throw HttpBadRequestExceptionApp(error.response?.statusMessage);
        case HttpStatus.internalServerError:
          throw HttpInternalServerErrorApp(error.response?.statusMessage);
        default:
          throw ExceptionApp(error.message);
      }
    }
  }
}
