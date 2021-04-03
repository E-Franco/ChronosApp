import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_dashboard/models/enum_data_filter.dart';
import 'package:mobile_dashboard/repositories/user_repository.dart';
import 'package:mobile_dashboard/stores/auth_store.dart';
import 'package:mobile_dashboard/stores/faturamento_store.dart';
import 'package:mobile_dashboard/stores/forma_pago_store.dart';
import 'package:mobile_dashboard/stores/receber_pagar_store.dart';
import 'package:mobile_dashboard/ui/home/periodo/faturamento_period_card.dart';
import 'package:mobile_dashboard/ui/home/periodo/forma_pago_period_card.dart';
import 'package:mobile_dashboard/ui/home/periodo/receber_pagar_period_chart.dart';
import 'package:mobile_dashboard/ui/home/week/faturamento_week_card.dart';
import 'package:mobile_dashboard/ui/home/week/forma_pago_week_card.dart';
import 'package:mobile_dashboard/ui/home/week/receber_pagar_week_chart.dart';
import 'package:mobile_dashboard/ui/home/widgets/drawer.dart';
import 'package:mobile_dashboard/ui/home/day/faturamento_day_card.dart';
import 'package:mobile_dashboard/ui/home/day/receber_pagar_day_chart.dart';

import 'day/forma_pago_day_card.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  final faturamentoStore = GetIt.I<FaturamentoStore>()..fetch();
  final receberPagarStore = GetIt.I<ReceberPagarStore>()..fetch();
  final formaPagoStore = GetIt.I<FormaPagoStore>()
    ..fetchByDay()
    ..fetchByWeek();

  TabController _tabController;
  bool datePickerShowing = false;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(tabListener);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(),
      drawer: AppDrawer(),
      body: Observer(
        builder: (_) {
          final faturamentoIsLoaded = faturamentoStore.faturamento != null;
          final receberPagarIsLoaded = receberPagarStore.receberPagar != null;
          final formaPagoIsLoaded = formaPagoStore.formaPagoDia != null && formaPagoStore.formaPagoSemana != null;

          if (faturamentoIsLoaded && receberPagarIsLoaded && formaPagoIsLoaded)
            return Container(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.blue,
                      unselectedLabelColor: Color(0xFF555555),
                      labelStyle: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.bold),
                      unselectedLabelStyle: GoogleFonts.ubuntu(fontSize: 16, fontWeight: FontWeight.normal),
                      tabs: [
                        Tab(text: 'Dia'),
                        Tab(text: 'Semana'),
                        Tab(text: 'Período'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        buildDayWidget(),
                        buildWeekWidget(),
                        buildPeriodWidget(context),
                      ],
                    ),
                  ),
                ],
              ),
            );
          else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }

  Widget buildDayWidget() {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      shrinkWrap: true,
      children: [
        FaturamentoDayCard(),
        SizedBox(height: 15),
        ReceberPagarDayWidget(),
        SizedBox(height: 15),
        FormaPagoDayCard(),
      ],
    );
  }

  Widget buildWeekWidget() {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      children: [
        FaturamentoWeekCard(),
        SizedBox(height: 15),
        ReceberPagarWeekWidget(),
        SizedBox(height: 15),
        FormaPagoWeekCard(),
      ],
    );
  }

  Widget buildPeriodWidget(BuildContext context) {
    return Observer(
      builder: (_) {
        final faturamentoIsLoaded = faturamentoStore.faturamentoPeriodo != null;
        final receberPagarIsLoaded = receberPagarStore.receberPagarPeriodo != null;
        final formaPagoIsLoaded = formaPagoStore.formaPagoPeriodo != null;

        if (faturamentoIsLoaded && receberPagarIsLoaded && formaPagoIsLoaded)
          return Scaffold(
            backgroundColor: Colors.grey[300],
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.date_range_rounded),
              onPressed: fetchData,
            ),
            body: SafeArea(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.fromLTRB(16, 20, 16, 100),
                children: [
                  FaturamentoPeriodCard(),
                  SizedBox(height: 15),
                  ReceberPagarPeriodWidget(),
                  SizedBox(height: 15),
                  FormaPagoPeriodCard(),
                ],
              ),
            ),
          );
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }

  void tabListener() {
    if (_tabController.index == 2.0) {
      if (!datePickerShowing) {
        setState(() {
          datePickerShowing = true;
        });

        fetchData();
      }
    }
  }

  Future<void> fetchData() async {
    faturamentoStore.clear();
    receberPagarStore.clear();
    formaPagoStore.clear();

    DateTimeRange range = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );

    if (range != null) {
      faturamentoStore.fetchByPeriod(range);
      receberPagarStore.fetchByPeriod(range);
      formaPagoStore.fetchByPeriod(range);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
