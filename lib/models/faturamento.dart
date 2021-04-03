import '../extensions/num_extension.dart';

class Faturamento {
  final num valorDia;
  final num qtdItemDia;
  final num ticketMedioDia;

  final num valorSemana;
  final num qtdItemSemana;
  final num ticketMedioSemana;

  final num valorPeriodo;
  final num qtdItemPeriodo;
  final num ticketMedioPeriodo;

  const Faturamento({
    this.valorDia = 0,
    this.valorSemana = 0,
    this.qtdItemDia = 0,
    this.ticketMedioDia = 0,
    this.qtdItemSemana = 0,
    this.ticketMedioSemana = 0,
    this.valorPeriodo = 0,
    this.qtdItemPeriodo = 0,
    this.ticketMedioPeriodo = 0,
  });

  factory Faturamento.fromJson(Map<String, dynamic> json) {
    if (json == null) return null;

    return Faturamento(
      valorDia: NumExt.checkAndParse(json['faturamento_dia']),
      qtdItemDia: NumExt.checkAndParse(json['qtd_item_dia']),
      ticketMedioDia: NumExt.checkAndParse(json['ticket_medio_dia']),
      valorSemana: NumExt.checkAndParse(json['faturamento_semana']),
      qtdItemSemana: NumExt.checkAndParse(json['qtd_item_semana']),
      ticketMedioSemana: NumExt.checkAndParse(json['ticket_medio_semana']),
      valorPeriodo: NumExt.checkAndParse(json['faturamento_periodo']),
      qtdItemPeriodo: NumExt.checkAndParse(json['qtd_item_periodo']),
      ticketMedioPeriodo: NumExt.checkAndParse(json['ticket_medio_periodo']),
    );
  }
}
