import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../models/failure.dart';
import '../models/forma_pago.dart';
import '../repositories/forma_pago_repository.dart';

part 'forma_pago_store.g.dart';

class FormaPagoStore = _FormaPagoStoreBase with _$FormaPagoStore;

abstract class _FormaPagoStoreBase with Store {
  @observable
  List<FormaPago> formaPagoDia;

  @observable
  List<FormaPago> formaPagoSemana;

  @observable
  List<FormaPago> formaPagoPeriodo;

  @observable
  bool inError = false;

  @action
  Future<void> fetchByDay() async {
    Either<Failure, List<FormaPago>> request = await FormaPagoRepository.instance.byDay();
    request.fold(
      (l) => inError = true,
      (r) => formaPagoDia = r,
    );
  }

  @action
  Future<void> fetchByWeek() async {
    Either<Failure, List<FormaPago>> request = await FormaPagoRepository.instance.byWeek();
    request.fold(
      (l) => inError = true,
      (r) => formaPagoSemana = r,
    );
  }

  @action
  Future<void> fetchByPeriod(DateTimeRange range) async {
    final start = range.start;
    final end = range.end;

    Either<Failure, List<FormaPago>> request = await FormaPagoRepository.instance.byPeriod(start, end);
    request.fold(
      (l) => inError = true,
      (r) => formaPagoPeriodo = r,
    );
  }

  @action
  void clear(){
    formaPagoPeriodo = null;
  }
}
