import 'package:calculadora_global/model/investimentos.dart';

class ResponseResumoRendaFixa {
  int? valorTotalAporte;
  double? valorTotalPatrimonioBruto;
  double? valorTotalPatrimonioLiquido;
  double? valorTotalLucro;
  int? diasInvestimento;
  List<Investimentos>? investimentos;

  ResponseResumoRendaFixa(
      {this.valorTotalAporte,
      this.valorTotalPatrimonioBruto,
      this.valorTotalPatrimonioLiquido,
      this.valorTotalLucro,
      this.diasInvestimento,
      this.investimentos});

  ResponseResumoRendaFixa.fromJson(Map<String, dynamic> json) {
    valorTotalAporte = json['valorTotalAporte'];
    valorTotalPatrimonioBruto = json['valorTotalPatrimonioBruto'];
    valorTotalPatrimonioLiquido = json['valorTotalPatrimonioLiquido'];
    valorTotalLucro = json['valorTotalLucro'];
    diasInvestimento = json['diasInvestimento'];
    if (json['investimentos'] != null) {
      investimentos = <Investimentos>[];
      json['investimentos'].forEach((v) {
        investimentos!.add(new Investimentos.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['valorTotalAporte'] = this.valorTotalAporte;
    data['valorTotalPatrimonioBruto'] = this.valorTotalPatrimonioBruto;
    data['valorTotalPatrimonioLiquido'] = this.valorTotalPatrimonioLiquido;
    data['valorTotalLucro'] = this.valorTotalLucro;
    data['diasInvestimento'] = this.diasInvestimento;
    if (this.investimentos != null) {
      data['investimentos'] = this.investimentos!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
