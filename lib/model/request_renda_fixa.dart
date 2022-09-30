class RequestRendaFixa {
  String? dataInvestimento;
  String? vencimentoInvestimento;
  double? valorInicial;
  double? valorAporteMensal;
  double? taxaAnual;
  int? tipoInvestimento;

  RequestRendaFixa(
      {this.dataInvestimento,
      this.vencimentoInvestimento,
      this.valorInicial,
      this.valorAporteMensal,
      this.taxaAnual,
      this.tipoInvestimento});

  RequestRendaFixa.fromJson(Map<String, dynamic> json) {
    dataInvestimento = json['dataInvestimento'];
    vencimentoInvestimento = json['vencimentoInvestimento'];
    valorInicial = json['valorInicial'];
    valorAporteMensal = json['valorAporteMensal'];
    taxaAnual = json['taxaAnual'];
    tipoInvestimento = json['tipoInvestimento'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dataInvestimento'] = this.dataInvestimento;
    data['vencimentoInvestimento'] = this.vencimentoInvestimento;
    data['valorInicial'] = this.valorInicial;
    data['valorAporteMensal'] = this.valorAporteMensal;
    data['taxaAnual'] = this.taxaAnual;
    data['tipoInvestimento'] = this.tipoInvestimento;
    return data;
  }
}
