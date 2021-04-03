import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_dashboard/repositories/forma_pago_repository.dart';

void main() {
  final repository = FormaPagoRepository.instance;
  test(
    'Forma Pago Repository - all',
    () async {
      final response = await repository.byDay();
      expect(response.isRight(), equals(true));
      expect(response.isLeft(), equals(false));
    },
  );
}
