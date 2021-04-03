import 'package:flutter/foundation.dart';

import '../extensions/num_extension.dart';

class FormaPago {
  final String formaPago;
  final num valorGs;

  const FormaPago({
    @required this.formaPago,
    @required this.valorGs,
  });

  factory FormaPago.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return FormaPago(
      formaPago: json['forma_pg'],
      valorGs: NumExt.checkAndParse(json['valor_gs']),
    );
  }
}
