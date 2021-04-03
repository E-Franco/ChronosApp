import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/faturamento.dart';
import '../repositories/faturamento_repository.dart';

part 'faturamento_store.g.dart';

class FaturamentoStore = _FaturamentoStoreBase with _$FaturamentoStore;

abstract class _FaturamentoStoreBase with Store {
  @observable
  Faturamento faturamento;

  @observable
  Faturamento faturamentoPeriodo;

  @observable
  DateTimeRange range;

  @observable
  bool inError = false;

  @action
  Future<void> fetch() async {
    final request = await FaturamentoRepository.instance.all();

    request.fold(
      (l) => inError = true,
      (r) => faturamento = r,
    );
  }

  @action
  Future<void> fetchByPeriod(DateTimeRange range) async {
    final start = range.start;
    final end = range.end;

    this.range = range;
    final request = await FaturamentoRepository.instance.byPeriod(start, end);
    request.fold(
      (l) => inError = true,
      (r) => faturamentoPeriodo = r,
    );
  }

  @action
  void clear() {
    faturamentoPeriodo = null;
  }
}
