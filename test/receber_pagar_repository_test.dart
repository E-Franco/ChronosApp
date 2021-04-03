import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_dashboard/repositories/receber_pagar_repository.dart';

void main() {
  final repository = ReceberPagarRepository.instance;
  test(
    'Receber Pagar Repository - all',
    () async {
      final response = await repository.all();
      expect(response.isRight(), equals(true));
      expect(response.isLeft(), equals(false));
    },
  );
}
