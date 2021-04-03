import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../../../stores/faturamento_store.dart';

class FaturamentoPeriodCard extends StatelessWidget {
  final faturamentoStore = GetIt.I<FaturamentoStore>();
  final style = GoogleFonts.ubuntu(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: Color(0xFF555555),
  );

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (faturamentoStore.faturamentoPeriodo == null) {
          return Container();
        }

        return Card(
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  'Período:',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(faturamentoStore.range.start)}',
                      style: style,
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.arrow_right_alt_rounded),
                    SizedBox(width: 5),
                    Text(
                      '${DateFormat(DateFormat.YEAR_ABBR_MONTH_DAY).format(faturamentoStore.range.end)}',
                      style: style,
                    ),
                  ],
                ),
                Container(
                  height: 130,
                  child: Swiper.children(
                    children: [
                      buildFaturamento(),
                      buildQtdItens(),
                      buildTicketMedio(),
                    ],
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                      ),
                    ),
                    control: SwiperControl(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget buildFaturamento() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Faturamento',
          style: TextStyle(
            fontSize: 17,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'GS ${faturamentoStore.faturamentoPeriodo.valorPeriodo.toStringAsFixed(2)}',
          style: style,
        ),
      ],
    );
  }

  Widget buildQtdItens() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Qtd itens',
          style: TextStyle(
            fontSize: 17,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '${faturamentoStore.faturamentoPeriodo.qtdItemPeriodo.toInt()}',
          style: style,
        ),
      ],
    );
  }

  Widget buildTicketMedio() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Ticket medio',
          style: TextStyle(
            fontSize: 17,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'GS ${faturamentoStore.faturamentoPeriodo.ticketMedioPeriodo.toStringAsFixed(2)}',
          style: style,
        ),
      ],
    );
  }
}
