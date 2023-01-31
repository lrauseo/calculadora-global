import 'dart:convert';

class ImpostoRenda {
  int? prazoInicial;
  int? prazoFinal;
  double? aliquota;
  ImpostoRenda({
    this.prazoInicial,
    this.prazoFinal,
    this.aliquota,
  });

  static List<ImpostoRenda> createTax() {
    return <ImpostoRenda>[
      ImpostoRenda(prazoInicial: 0, prazoFinal: 180, aliquota: 22.5),
      ImpostoRenda(prazoInicial: 181, prazoFinal: 360, aliquota: 20),
      ImpostoRenda(prazoInicial: 361, prazoFinal: 720, aliquota: 17.5),
      ImpostoRenda(prazoInicial: 720, prazoFinal: 999, aliquota: 15.0),
    ];
  }

  ImpostoRenda copyWith({
    int? prazoInicial,
    int? prazoFinal,
    double? aliquota,
  }) {
    return ImpostoRenda(
      prazoInicial: prazoInicial ?? this.prazoInicial,
      prazoFinal: prazoFinal ?? this.prazoFinal,
      aliquota: aliquota ?? this.aliquota,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prazoInicial': prazoInicial,
      'prazoFinal': prazoFinal,
      'aliquota': aliquota,
    };
  }

  factory ImpostoRenda.fromMap(Map<String, dynamic> map) {
    return ImpostoRenda(
      prazoInicial: map['prazoInicial']?.toInt(),
      prazoFinal: map['prazoFinal']?.toInt(),
      aliquota: map['aliquota']?.toDouble(),
    );
  }

  String toJson() => json.encode(toMap());

  factory ImpostoRenda.fromJson(String source) => ImpostoRenda.fromMap(json.decode(source));

  @override
  String toString() =>
      'ImpostoRenda(prazoInicial: $prazoInicial, prazoFinal: $prazoFinal, aliquota: $aliquota)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ImpostoRenda &&
        other.prazoInicial == prazoInicial &&
        other.prazoFinal == prazoFinal &&
        other.aliquota == aliquota;
  }

  @override
  int get hashCode => prazoInicial.hashCode ^ prazoFinal.hashCode ^ aliquota.hashCode;
}
