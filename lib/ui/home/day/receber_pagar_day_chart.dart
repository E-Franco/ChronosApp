import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../stores/receber_pagar_store.dart';

class ReceberPagarDayWidget extends StatefulWidget {
  @override
  _ReceberPagarDayWidgetState createState() => _ReceberPagarDayWidgetState();
}

class _ReceberPagarDayWidgetState extends State<ReceberPagarDayWidget> {
  final receberPagarStore = GetIt.I<ReceberPagarStore>();
  num pagar;
  num receber;
  num total;

  @override
  void initState() {
    pagar = receberPagarStore.receberPagar.pagarDia;
    receber = receberPagarStore.receberPagar.receberDia;
    total = pagar + receber;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Contas a pagar e receber',
            style: TextStyle(
              fontSize: 17,
              color: Colors.blue,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 16, top: 16, right: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.redAccent,
                  ),
                  child: Center(
                    child: Icon(Icons.attach_money_rounded, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Pagar:',
                  style: GoogleFonts.ubuntu(color: Colors.redAccent),
                ),
                Spacer(),
                Text(
                  pagar.toStringAsFixed(2).replaceAll('.', ','),
                  style: GoogleFonts.ubuntu(color: Colors.redAccent),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Icon(Icons.attach_money_rounded, color: Colors.white),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Receber:',
                  style: GoogleFonts.ubuntu(color: Colors.green),
                ),
                Spacer(),
                Text(
                  receber.toStringAsFixed(2).replaceAll('.', ','),
                  style: GoogleFonts.ubuntu(color: Colors.green),
                ),
              ],
            ),
          ),
          if (total == 0) SizedBox(height: 16),
          if (total != 0)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Text(
                    '${(pagar / total * 100).toStringAsFixed(2)}%',
                    style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      color: Colors.redAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: PieChart(
                        PieChartData(
                          pieTouchData: PieTouchData(),
                          borderData: FlBorderData(
                            show: false,
                          ),
                          sectionsSpace: pagar == 0 || receber == 0 ? 0 : 2,
                          centerSpaceRadius: 0,
                          sections: showingSections(),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    '${(receber / total * 100).toStringAsFixed(2)}%',
                    style: GoogleFonts.ubuntu(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    final double radius = 100;

    return [
      PieChartSectionData(
        color: Colors.redAccent,
        value: pagar.toDouble(),
        radius: radius,
        title: '',
      ),
      PieChartSectionData(
        color: Colors.green,
        value: receber.toDouble(),
        radius: radius,
        title: '',
      ),
    ];
  }
}
