// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FaturamentoStore on _FaturamentoStoreBase, Store {
  final _$faturamentoAtom = Atom(name: '_FaturamentoStoreBase.faturamento');

  @override
  Faturamento get faturamento {
    _$faturamentoAtom.reportRead();
    return super.faturamento;
  }

  @override
  set faturamento(Faturamento value) {
    _$faturamentoAtom.reportWrite(value, super.faturamento, () {
      super.faturamento = value;
    });
  }

  final _$faturamentoPeriodoAtom =
      Atom(name: '_FaturamentoStoreBase.faturamentoPeriodo');

  @override
  Faturamento get faturamentoPeriodo {
    _$faturamentoPeriodoAtom.reportRead();
    return super.faturamentoPeriodo;
  }

  @override
  set faturamentoPeriodo(Faturamento value) {
    _$faturamentoPeriodoAtom.reportWrite(value, super.faturamentoPeriodo, () {
      super.faturamentoPeriodo = value;
    });
  }

  final _$rangeAtom = Atom(name: '_FaturamentoStoreBase.range');

  @override
  DateTimeRange get range {
    _$rangeAtom.reportRead();
    return super.range;
  }

  @override
  set range(DateTimeRange value) {
    _$rangeAtom.reportWrite(value, super.range, () {
      super.range = value;
    });
  }

  final _$inErrorAtom = Atom(name: '_FaturamentoStoreBase.inError');

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

  final _$fetchAsyncAction = AsyncAction('_FaturamentoStoreBase.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$fetchByPeriodAsyncAction =
      AsyncAction('_FaturamentoStoreBase.fetchByPeriod');

  @override
  Future<void> fetchByPeriod(DateTimeRange range) {
    return _$fetchByPeriodAsyncAction.run(() => super.fetchByPeriod(range));
  }

  final _$_FaturamentoStoreBaseActionController =
      ActionController(name: '_FaturamentoStoreBase');

  @override
  void clear() {
    final _$actionInfo = _$_FaturamentoStoreBaseActionController.startAction(
        name: '_FaturamentoStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_FaturamentoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
faturamento: ${faturamento},
faturamentoPeriodo: ${faturamentoPeriodo},
range: ${range},
inError: ${inError}
    ''';
  }
}
