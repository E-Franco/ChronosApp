// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forma_pago_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FormaPagoStore on _FormaPagoStoreBase, Store {
  final _$formaPagoDiaAtom = Atom(name: '_FormaPagoStoreBase.formaPagoDia');

  @override
  List<FormaPago> get formaPagoDia {
    _$formaPagoDiaAtom.reportRead();
    return super.formaPagoDia;
  }

  @override
  set formaPagoDia(List<FormaPago> value) {
    _$formaPagoDiaAtom.reportWrite(value, super.formaPagoDia, () {
      super.formaPagoDia = value;
    });
  }

  final _$formaPagoSemanaAtom =
      Atom(name: '_FormaPagoStoreBase.formaPagoSemana');

  @override
  List<FormaPago> get formaPagoSemana {
    _$formaPagoSemanaAtom.reportRead();
    return super.formaPagoSemana;
  }

  @override
  set formaPagoSemana(List<FormaPago> value) {
    _$formaPagoSemanaAtom.reportWrite(value, super.formaPagoSemana, () {
      super.formaPagoSemana = value;
    });
  }

  final _$formaPagoPeriodoAtom =
      Atom(name: '_FormaPagoStoreBase.formaPagoPeriodo');

  @override
  List<FormaPago> get formaPagoPeriodo {
    _$formaPagoPeriodoAtom.reportRead();
    return super.formaPagoPeriodo;
  }

  @override
  set formaPagoPeriodo(List<FormaPago> value) {
    _$formaPagoPeriodoAtom.reportWrite(value, super.formaPagoPeriodo, () {
      super.formaPagoPeriodo = value;
    });
  }

  final _$inErrorAtom = Atom(name: '_FormaPagoStoreBase.inError');

  @override
  bool get inError {
    _$inErrorAtom.reportRead();
    return super.inError;
  }

  @override
  set inError(bool value) {
    _$inErrorAtom.reportWrite(value, super.inError, () {
      super.inError = value;
    });
  }

  final _$fetchByDayAsyncAction = AsyncAction('_FormaPagoStoreBase.fetchByDay');

  @override
  Future<void> fetchByDay() {
    return _$fetchByDayAsyncAction.run(() => super.fetchByDay());
  }

  final _$fetchByWeekAsyncAction =
      AsyncAction('_FormaPagoStoreBase.fetchByWeek');

  @override
  Future<void> fetchByWeek() {
    return _$fetchByWeekAsyncAction.run(() => super.fetchByWeek());
  }

  final _$fetchByPeriodAsyncAction =
      AsyncAction('_FormaPagoStoreBase.fetchByPeriod');

  @override
  Future<void> fetchByPeriod(DateTimeRange range) {
    return _$fetchByPeriodAsyncAction.run(() => super.fetchByPeriod(range));
  }

  final _$_FormaPagoStoreBaseActionController =
      ActionController(name: '_FormaPagoStoreBase');

  @override
  void clear() {
    final _$actionInfo = _$_FormaPagoStoreBaseActionController.startAction(
        name: '_FormaPagoStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_FormaPagoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
formaPagoDia: ${formaPagoDia},
formaPagoSemana: ${formaPagoSemana},
formaPagoPeriodo: ${formaPagoPeriodo},
inError: ${inError}
    ''';
  }
}
