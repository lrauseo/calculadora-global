import 'dart:convert';

class Investimentos {
  double? percentualAno;
  double? percentualMes;
  double? valorAporte;
  double? valorPatrimonio;
  String? nomeMes;
  int? mes;
  int? ano;
  Investimentos({
    this.percentualAno,
    this.percentualMes,
    this.valorAporte,
    this.valorPatrimonio,
    this.nomeMes,
    this.mes,
    this.ano,
  });

  Investimentos copyWith({
    double? percentualAno,
    double? percentualMes,
    double? valorAporte,
    double? valorPatrimonio,
    String? nomeMes,
    int? mes,
    int? ano,
  }) {
    return Investimentos(
      percentualAno: percentualAno ?? this.percentualAno,
      percentualMes: percentualMes ?? this.percentualMes,
      valorAporte: valorAporte ?? this.valorAporte,
      valorPatrimonio: valorPatrimonio ?? this.valorPatrimonio,
      nomeMes: nomeMes ?? this.nomeMes,
      mes: mes ?? this.mes,
      ano: ano ?? this.ano,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'percentualAno': percentualAno,
      'percentualMes': percentualMes,
      'valorAporte': valorAporte,
      'valorPatrimonio': valorPatrimonio,
      'nomeMes': nomeMes,
      'mes': mes,
      'ano': ano,
    };
  }

  factory Investimentos.fromMap(Map<String, dynamic> map) {
    return Investimentos(
      percentualAno: map['percentualAno']?.toDouble(),
      percentualMes: map['percentualMes']?.toDouble(),
      valorAporte: map['valorAporte']?.toDouble(),
      valorPatrimonio: map['valorPatrimonio']?.toDouble(),
      nomeMes: map['nomeMes'],
      mes: map['mes']?.toInt(),
      ano: map['ano']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Investimentos.fromJson(String source) => Investimentos.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Investimentos(percentualAno: $percentualAno, percentualMes: $percentualMes, valorAporte: $valorAporte, valorPatrimonio: $valorPatrimonio, nomeMes: $nomeMes, mes: $mes, ano: $ano)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Investimentos &&
        other.percentualAno == percentualAno &&
        other.percentualMes == percentualMes &&
        other.valorAporte == valorAporte &&
        other.valorPatrimonio == valorPatrimonio &&
        other.nomeMes == nomeMes &&
        other.mes == mes &&
        other.ano == ano;
  }

  @override
  int get hashCode {
    return percentualAno.hashCode ^
        percentualMes.hashCode ^
        valorAporte.hashCode ^
        valorPatrimonio.hashCode ^
        nomeMes.hashCode ^
        mes.hashCode ^
        ano.hashCode;
  }
}
