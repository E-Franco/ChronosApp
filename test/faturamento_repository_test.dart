import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_dashboard/repositories/faturamento_repository.dart';

void main() {
  final repository = FaturamentoRepository.instance;
  test(
    'Faturamento Repository - all',
    () async {
      final response = await repository.all();
      expect(response.isRight(), equals(true));
      expect(response.isLeft(), equals(false));
    },
  );
}
