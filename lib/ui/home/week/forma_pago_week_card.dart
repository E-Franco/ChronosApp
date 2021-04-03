import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../stores/forma_pago_store.dart';

class FormaPagoWeekCard extends StatelessWidget {
  final formaPagoStore = GetIt.I<FormaPagoStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        if (formaPagoStore.formaPagoSemana == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (formaPagoStore.formaPagoSemana.isEmpty) {
          return Container();
        }

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Venda por finalizadora',
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(height: 16),
                _Tile(
                  icon: Icons.attach_money_rounded,
                  iconColor: Colors.green,
                  label: formaPagoStore.formaPagoSemana[0].formaPago,
                  value: formaPagoStore.formaPagoSemana[0].valorGs.toStringAsFixed(2).replaceAll('.', ','),
                ),
                SizedBox(height: 10),
                _Tile(
                  icon: Icons.attach_money_rounded,
                  iconColor: Colors.redAccent,
                  label: formaPagoStore.formaPagoSemana[1].formaPago,
                  value: formaPagoStore.formaPagoSemana[1].valorGs.toStringAsFixed(2).replaceAll('.', ','),
                ),
                SizedBox(height: 10),
                _Tile(
                  icon: Icons.credit_card_rounded,
                  iconColor: Colors.green,
                  label: formaPagoStore.formaPagoSemana[2].formaPago,
                  value: formaPagoStore.formaPagoSemana[2].valorGs.toStringAsFixed(2).replaceAll('.', ','),
                ),
                SizedBox(height: 10),
                _Tile(
                  icon: Icons.credit_card_rounded,
                  iconColor: Colors.brown,
                  label: formaPagoStore.formaPagoSemana[3].formaPago,
                  value: formaPagoStore.formaPagoSemana[3].valorGs.toStringAsFixed(2).replaceAll('.', ','),
                ),
                SizedBox(height: 10),
                _Tile(
                  icon: Icons.compare_arrows_sharp,
                  iconColor: Colors.blue,
                  label: formaPagoStore.formaPagoSemana[4].formaPago,
                  value: formaPagoStore.formaPagoSemana[4].valorGs.toStringAsFixed(2).replaceAll('.', ','),
                ),
                SizedBox(height: 10),
                _Tile(
                  icon: Icons.attach_money_rounded,
                  iconColor: Colors.blue,
                  label: formaPagoStore.formaPagoSemana[5].formaPago,
                  value: formaPagoStore.formaPagoSemana[5].valorGs.toStringAsFixed(2).replaceAll('.', ','),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Tile extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color iconColor;
  final String value;

  const _Tile({
    @required this.label,
    @required this.icon,
    @required this.iconColor,
    @required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: iconColor,
          ),
          padding: EdgeInsets.all(3),
          child: Center(
            child: Icon(icon, color: Colors.white),
          ),
        ),
        SizedBox(width: 10),
        Text(
          label,
          style: GoogleFonts.ubuntu(color: Color(0xFF4444444)),
        ),
        Spacer(),
        Text(
          value,
          style: GoogleFonts.ubuntu(color: Color(0xFF4444444)),
        ),
      ],
    );
  }
}
