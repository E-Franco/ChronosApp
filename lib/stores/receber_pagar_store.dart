import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/failure.dart';
import '../models/receber_pagar.dart';
import '../repositories/receber_pagar_repository.dart';

part 'receber_pagar_store.g.dart';

class ReceberPagarStore = _ReceberPagarStoreBase with _$ReceberPagarStore;

abstract class _ReceberPagarStoreBase with Store {
  @observable
  ReceberPagar receberPagar;

  @observable
  ReceberPagar receberPagarPeriodo;

  @observable
  bool inError = false;

  @action
  Future<void> fetch() async {
    Either<Failure, ReceberPagar> request = await ReceberPagarRepository.instance.all();
    request.fold(
      (l) => inError = true,
      (r) => receberPagar = r,
    );
  }

  @action
  Future<void> fetchByPeriod(DateTimeRange range) async {
    final start = range.start;
    final end = range.end;

    final request = await ReceberPagarRepository.instance.byPeriod(start, end);
    request.fold(
      (l) => inError = true,
      (r) => receberPagarPeriodo = r,
    );
  }

  @action
  void clear() {
    receberPagarPeriodo = null;
  }
}
