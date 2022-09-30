import 'package:calculadora_global/model/request_renda_fixa.dart';
import 'package:calculadora_global/model/response_resumo_renda_fixa.dart';

abstract class RendaFixaRepository {
  Future<ResponseResumoRendaFixa?> calcularRendaFixa(RequestRendaFixa rendaFixa);
}
