import 'package:flutter/foundation.dart';

import '../extensions/num_extension.dart';

class ReceberPagar {
  final num receberDia;
  final num pagarDia;

  final num receberSemana;
  final num pagarSemana;

  final num receberPeriodo;
  final num pagarPeriodo;

  ReceberPagar({
    @required this.receberDia,
    @required this.receberSemana,
    @required this.pagarDia,
    @required this.pagarSemana,
    @required this.receberPeriodo,
    @required this.pagarPeriodo,
  });

  factory ReceberPagar.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return ReceberPagar(
      pagarDia: NumExt.checkAndParse(json['pagar_dia']),
      pagarSemana: NumExt.checkAndParse(json['pagar_semana']),
      receberDia: NumExt.checkAndParse(json['receber_dia']),
      receberSemana: NumExt.checkAndParse(json['receber_semana']),
      pagarPeriodo: NumExt.checkAndParse(json['pagar_periodo']),
      receberPeriodo: NumExt.checkAndParse(json['receber_periodo']),
    );
  }
}
