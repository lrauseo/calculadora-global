class Investimentos {
  int? percentualAno;
  double? percentualMes;
  int? valorAporte;
  double? valorPatrimonio;
  String? nomeMes;
  int? mes;
  int? ano;

  Investimentos(
      {this.percentualAno,
      this.percentualMes,
      this.valorAporte,
      this.valorPatrimonio,
      this.nomeMes,
      this.mes,
      this.ano});

  Investimentos.fromJson(Map<String, dynamic> json) {
    percentualAno = json['percentualAno'];
    percentualMes = json['percentualMes'];
    valorAporte = json['valorAporte'];
    valorPatrimonio = json['valorPatrimonio'];
    nomeMes = json['nomeMes'];
    mes = json['mes'];
    ano = json['ano'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['percentualAno'] = this.percentualAno;
    data['percentualMes'] = this.percentualMes;
    data['valorAporte'] = this.valorAporte;
    data['valorPatrimonio'] = this.valorPatrimonio;
    data['nomeMes'] = this.nomeMes;
    data['mes'] = this.mes;
    data['ano'] = this.ano;
    return data;
  }
}
