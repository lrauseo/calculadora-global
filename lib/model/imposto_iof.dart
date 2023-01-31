import 'dart:convert';

class ImpostoIof {
  int? diaAplicacao;

  double? aliquota;

  ImpostoIof({
    this.diaAplicacao,
    this.aliquota,
  });

  static List<ImpostoIof> createTax() {
    return <ImpostoIof>[
      ImpostoIof(aliquota: 96.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 93.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 90.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 86.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 83.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 80.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 76.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 73.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 70.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 66.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 63.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 60.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 56.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 53.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 50.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 46.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 43.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 40.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 36.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 33.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 30.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 26.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 23.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 20.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 16.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 13.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 10.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 6.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 3.0, diaAplicacao: 0),
      ImpostoIof(aliquota: 0, diaAplicacao: 0),
    ];
  }

  ImpostoIof copyWith({
    int? diaAplicacao,
    double? aliquota,
  }) {
    return ImpostoIof(
      diaAplicacao: diaAplicacao ?? this.diaAplicacao,
      aliquota: aliquota ?? this.aliquota,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'diaAplicacao': diaAplicacao,
      'aliquota': aliquota,
    };
  }

  factory ImpostoIof.fromMap(Map<String, dynamic> map) {
    return ImpostoIof(
      diaAplicacao: map['diaAplicacao']?.toInt(),
      aliquota: map['aliquota']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpostoIof.fromJson(String source) => ImpostoIof.fromMap(json.decode(source));

  @override
  String toString() => 'ImpostoIof(diaAplicacao: $diaAplicacao, aliquota: $aliquota)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImpostoIof && other.diaAplicacao == diaAplicacao && other.aliquota == aliquota;
  }

  @override
  int get hashCode => diaAplicacao.hashCode ^ aliquota.hashCode;
}
