import 'package:calculadora_global/model/exceptions/exception_app.dart';
import 'package:calculadora_global/model/exceptions/http_badrequest_exception_app.dart';
import 'package:calculadora_global/model/exceptions/http_internal_server_error_exception_app.dart';
import 'package:calculadora_global/model/imposto_iof.dart';
import 'package:calculadora_global/model/imposto_renda.dart';
import 'package:calculadora_global/model/investimentos.dart';
import 'package:calculadora_global/model/response_resumo_renda_fixa.dart';
import 'package:calculadora_global/model/request_renda_fixa.dart';
import 'package:calculadora_global/repository/renda_fixa_repository.dart';
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class RendaFixaLocalRepositoryImpl extends RendaFixaRepository {
  @override
  Future<ResponseResumoRendaFixa?> calcularRendaFixa(RequestRendaFixa rendaFixa) async {
    try {
      ResponseResumoRendaFixa resumo = ResponseResumoRendaFixa();
      resumo.investimentos = <Investimentos>[];
      var dataInvestimento = DateTime.parse(rendaFixa.dataInvestimento!);
      var dataVencimento = DateTime.parse(rendaFixa.vencimentoInvestimento!);
      var dias = dataVencimento.difference(dataInvestimento).inDays;
      resumo.diasInvestimento = dias;
      DateTime dataInvestimentoAtual = dataInvestimento;
      bool primeiraIteracao = true;
      double patrimonio = 0;
      while (dataVencimento.compareTo(dataInvestimentoAtual) >= 0) {
        double taxaMensal = (rendaFixa.taxaAnual! / 12);
        double aporteMensal = 0;
        if (primeiraIteracao) {
          aporteMensal = 0;
        } else {
          aporteMensal = rendaFixa.valorAporteMensal!;
        }

        if (primeiraIteracao) {
          var ultimoDiaMes = DateTime(dataInvestimentoAtual.year, dataInvestimentoAtual.month + 1, 0);
          var diasInvestimentoParcial = ultimoDiaMes.difference(dataInvestimentoAtual).inDays;
          double taxaDia = taxaMensal / ultimoDiaMes.day;
          patrimonio = patrimonio + rendaFixa.valorInicial!;
          double lucro = 0;

          for (int i = 1; i <= diasInvestimentoParcial; i++) {
            lucro = patrimonio * (taxaDia / 100);
            patrimonio = patrimonio + lucro;
            resumo.valorTotalLucro = (resumo.valorTotalLucro ?? 0 + lucro);
          }
          var investimento = Investimentos();

          investimento.percentualAno = rendaFixa.taxaAnual;
          investimento.percentualMes = taxaMensal;
          investimento.mes = dataInvestimentoAtual.month;
          investimento.ano = dataInvestimentoAtual.year;
          investimento.nomeMes = dataInvestimentoAtual.month.toString();
          investimento.valorAporte = (primeiraIteracao ? rendaFixa.valorInicial : aporteMensal);
          investimento.valorPatrimonio = patrimonio;
          resumo.investimentos?.add(investimento);
          primeiraIteracao = false;
          dataInvestimentoAtual = DateTime(
              dataInvestimentoAtual.year, dataInvestimentoAtual.month + 1, dataInvestimentoAtual.day);
          resumo.valorTotalPatrimonioBruto = patrimonio;
          continue;
        }
        resumo = _calculaPatrimonio(resumo, aporteMensal, taxaMensal);
        patrimonio = resumo.valorTotalPatrimonioBruto!;

        var investimento = Investimentos();
        investimento.percentualAno = rendaFixa.taxaAnual;
        investimento.percentualMes = taxaMensal;
        investimento.mes = dataInvestimentoAtual.month;
        investimento.ano = dataInvestimentoAtual.year;
        investimento.nomeMes = dataInvestimentoAtual.month.toString();
        investimento.valorAporte = (primeiraIteracao ? rendaFixa.valorInicial : aporteMensal);
        investimento.valorPatrimonio = resumo.valorTotalPatrimonioBruto;
        resumo.investimentos?.add(investimento);

        dataInvestimentoAtual =
            DateTime(dataInvestimentoAtual.year, dataInvestimentoAtual.month + 1, dataInvestimentoAtual.day);
      }
      resumo = _calculaPatrimonioLiquido(resumo);
      Future.delayed(const Duration(milliseconds: 1));
      return Future.value(resumo);
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

  ResponseResumoRendaFixa _calculaPatrimonio(
      ResponseResumoRendaFixa resumo, double valorAporteMensal, double taxaMensal) {
    resumo.valorTotalPatrimonioBruto = (resumo.valorTotalPatrimonioBruto! + valorAporteMensal);
    double taxa = taxaMensal / 100;

    double lucro = resumo.valorTotalPatrimonioBruto! * taxa;

    resumo.valorTotalPatrimonioBruto = resumo.valorTotalPatrimonioBruto! + lucro;
    resumo.valorTotalAporte = resumo.valorTotalAporte ?? 0;
    resumo.valorTotalAporte = resumo.valorTotalAporte! + valorAporteMensal;
    resumo.valorTotalLucro = resumo.valorTotalLucro ?? 0 + lucro;

    return resumo;
  }
}

ResponseResumoRendaFixa _calculaPatrimonioLiquido(ResponseResumoRendaFixa resumo) {
  var listaIr = ImpostoRenda.createTax();
  ImpostoRenda taxaIr = listaIr.firstWhere(
      (ir) => resumo.diasInvestimento! >= ir.prazoInicial! && resumo.diasInvestimento! <= ir.prazoFinal!);
  if (taxaIr == null) return resumo;
  double valorIr = resumo.valorTotalLucro! * taxaIr.aliquota! / 100;
  double valorIof = 0;
  if (resumo.diasInvestimento! < 30) {
    var listaIof = ImpostoIof.createTax();
    ImpostoIof taxaIof = listaIof.firstWhere((iof) => iof == resumo.diasInvestimento);
    valorIof = resumo.valorTotalLucro! * taxaIof.aliquota! / 100;
  }
  resumo.valorTotalPatrimonioLiquido = resumo.valorTotalPatrimonioBruto! - (valorIr + valorIof);

  resumo.valorTotalPatrimonioBruto = resumo.valorTotalPatrimonioBruto;
  return resumo;
}
