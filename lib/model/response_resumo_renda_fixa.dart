import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:calculadora_global/model/investimentos.dart';

class ResponseResumoRendaFixa {
  double? valorTotalAporte;
  double? valorTotalPatrimonioBruto;
  double? valorTotalPatrimonioLiquido;
  double? valorTotalLucro;
  int? diasInvestimento;
  List<Investimentos>? investimentos;
  ResponseResumoRendaFixa({
    this.valorTotalAporte,
    this.valorTotalPatrimonioBruto,
    this.valorTotalPatrimonioLiquido,
    this.valorTotalLucro,
    this.diasInvestimento,
    this.investimentos,
  });

  ResponseResumoRendaFixa copyWith({
    double? valorTotalAporte,
    double? valorTotalPatrimonioBruto,
    double? valorTotalPatrimonioLiquido,
    double? valorTotalLucro,
    int? diasInvestimento,
    List<Investimentos>? investimentos,
  }) {
    return ResponseResumoRendaFixa(
      valorTotalAporte: valorTotalAporte ?? this.valorTotalAporte,
      valorTotalPatrimonioBruto: valorTotalPatrimonioBruto ?? this.valorTotalPatrimonioBruto,
      valorTotalPatrimonioLiquido: valorTotalPatrimonioLiquido ?? this.valorTotalPatrimonioLiquido,
      valorTotalLucro: valorTotalLucro ?? this.valorTotalLucro,
      diasInvestimento: diasInvestimento ?? this.diasInvestimento,
      investimentos: investimentos ?? this.investimentos,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'valorTotalAporte': valorTotalAporte,
      'valorTotalPatrimonioBruto': valorTotalPatrimonioBruto,
      'valorTotalPatrimonioLiquido': valorTotalPatrimonioLiquido,
      'valorTotalLucro': valorTotalLucro,
      'diasInvestimento': diasInvestimento,
      'investimentos': investimentos?.map((x) => x?.toMap())?.toList(),
    };
  }

  factory ResponseResumoRendaFixa.fromMap(Map<String, dynamic> map) {
    return ResponseResumoRendaFixa(
      valorTotalAporte: map['valorTotalAporte']?.toDouble(),
      valorTotalPatrimonioBruto: map['valorTotalPatrimonioBruto']?.toDouble(),
      valorTotalPatrimonioLiquido: map['valorTotalPatrimonioLiquido']?.toDouble(),
      valorTotalLucro: map['valorTotalLucro']?.toDouble(),
      diasInvestimento: map['diasInvestimento']?.toInt(),
      investimentos: map['investimentos'] != null
          ? List<Investimentos>.from(map['investimentos']?.map((x) => Investimentos.fromMap(x)))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseResumoRendaFixa.fromJson(String source) =>
      ResponseResumoRendaFixa.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ResponseResumoRendaFixa(valorTotalAporte: $valorTotalAporte, valorTotalPatrimonioBruto: $valorTotalPatrimonioBruto, valorTotalPatrimonioLiquido: $valorTotalPatrimonioLiquido, valorTotalLucro: $valorTotalLucro, diasInvestimento: $diasInvestimento, investimentos: $investimentos)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ResponseResumoRendaFixa &&
        other.valorTotalAporte == valorTotalAporte &&
        other.valorTotalPatrimonioBruto == valorTotalPatrimonioBruto &&
        other.valorTotalPatrimonioLiquido == valorTotalPatrimonioLiquido &&
        other.valorTotalLucro == valorTotalLucro &&
        other.diasInvestimento == diasInvestimento &&
        listEquals(other.investimentos, investimentos);
  }

  @override
  int get hashCode {
    return valorTotalAporte.hashCode ^
        valorTotalPatrimonioBruto.hashCode ^
        valorTotalPatrimonioLiquido.hashCode ^
        valorTotalLucro.hashCode ^
        diasInvestimento.hashCode ^
        investimentos.hashCode;
  }
}
