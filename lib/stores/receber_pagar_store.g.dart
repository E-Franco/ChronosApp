// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receber_pagar_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ReceberPagarStore on _ReceberPagarStoreBase, Store {
  final _$receberPagarAtom = Atom(name: '_ReceberPagarStoreBase.receberPagar');

  @override
  ReceberPagar get receberPagar {
    _$receberPagarAtom.reportRead();
    return super.receberPagar;
  }

  @override
  set receberPagar(ReceberPagar value) {
    _$receberPagarAtom.reportWrite(value, super.receberPagar, () {
      super.receberPagar = value;
    });
  }

  final _$receberPagarPeriodoAtom =
      Atom(name: '_ReceberPagarStoreBase.receberPagarPeriodo');

  @override
  ReceberPagar get receberPagarPeriodo {
    _$receberPagarPeriodoAtom.reportRead();
    return super.receberPagarPeriodo;
  }

  @override
  set receberPagarPeriodo(ReceberPagar value) {
    _$receberPagarPeriodoAtom.reportWrite(value, super.receberPagarPeriodo, () {
      super.receberPagarPeriodo = value;
    });
  }

  final _$inErrorAtom = Atom(name: '_ReceberPagarStoreBase.inError');

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

  final _$fetchAsyncAction = AsyncAction('_ReceberPagarStoreBase.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$fetchByPeriodAsyncAction =
      AsyncAction('_ReceberPagarStoreBase.fetchByPeriod');

  @override
  Future<void> fetchByPeriod(DateTimeRange range) {
    return _$fetchByPeriodAsyncAction.run(() => super.fetchByPeriod(range));
  }

  final _$_ReceberPagarStoreBaseActionController =
      ActionController(name: '_ReceberPagarStoreBase');

  @override
  void clear() {
    final _$actionInfo = _$_ReceberPagarStoreBaseActionController.startAction(
        name: '_ReceberPagarStoreBase.clear');
    try {
      return super.clear();
    } finally {
      _$_ReceberPagarStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
receberPagar: ${receberPagar},
receberPagarPeriodo: ${receberPagarPeriodo},
inError: ${inError}
    ''';
  }
}
