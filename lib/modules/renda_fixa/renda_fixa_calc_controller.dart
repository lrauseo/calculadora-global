import 'package:calculadora_global/model/request_renda_fixa.dart';
import 'package:calculadora_global/model/response_resumo_renda_fixa.dart';
import 'package:calculadora_global/repository/renda_fixa_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RendaFixaCalcController extends GetxController {
  final RendaFixaRepositoryImpl repository = Get.find();

  final dataInvestimentoController =
      TextEditingController(text: DateFormat('dd/MM/yyyy').format(DateTime.now()));
  final dataVencimentoController = TextEditingController(
      text: DateFormat('dd/MM/yyyy').format(DateTime.now().add(const Duration(days: 90))));
  final valorInicialController = TextEditingController();
  final aporteMensalController = TextEditingController();
  final taxaAnualController = TextEditingController();
  var responseRendaFixa = ResponseResumoRendaFixa().obs;
  String? dataInvestimentoEnvioJson = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String? dataVencimentoEnvioJson =
      DateFormat('yyyy-MM-dd').format(DateTime.now().add(const Duration(days: 90)));

  void calcularRendaFixa() async {
    var taxaAnual = double.parse(taxaAnualController.text.replaceAll(',', '.').replaceAll('%', '').trim());
    var aporte = double.parse(aporteMensalController.text.replaceAll(',', '.').replaceAll('R\$', '').trim());
    var inicial = double.parse(valorInicialController.text.replaceAll(',', '.').replaceAll('R\$', '').trim());
    var result = (await repository.calcularRendaFixa(RequestRendaFixa(
        dataInvestimento: dataInvestimentoEnvioJson,
        vencimentoInvestimento: dataVencimentoEnvioJson,
        taxaAnual: taxaAnual,
        tipoInvestimento: 1,
        valorAporteMensal: aporte,
        valorInicial: inicial)));

    responseRendaFixa.value = result!;
  }
}
