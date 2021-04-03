import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobile_dashboard/models/failure.dart';
import 'package:mobile_dashboard/models/receber_pagar.dart';
import 'package:mobile_dashboard/utils/dio_service.dart';

class ReceberPagarRepository {
  ReceberPagarRepository._();
  static ReceberPagarRepository _instance;
  static ReceberPagarRepository get instance => _instance ??= ReceberPagarRepository._();

  final dioService = GetIt.I<DioService>();
  final String baseUrl = '/apis/receber_pagar';

  Future<Either<Failure, ReceberPagar>> all() async {
    try {
      final response = await dioService.dio.get(baseUrl);
      if (response.statusCode != 200) {
        return Left(Failure(response.data, response.statusCode));
      } else {
        final model = ReceberPagar.fromJson(response.data);
        return Right(model);
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return Left(Failure('Falha ao comunicar-se com o servidor', 500));
      }

      return Left(Failure(e.message, e.response?.statusCode));
    } catch (e) {
      return Left(Failure(e.toString(), 500));
    }
  }

  Future<Either<Failure, ReceberPagar>> byPeriod(DateTime start, DateTime end) async {
    try {
      final formattedStart = DateFormat('yyyy-MM-dd').format(start);
      final formattedEnd = DateFormat('yyyy-MM-dd').format(end);

      final response = await dioService.dio.get('$baseUrl?inicio=$formattedStart&final=$formattedEnd');
      if (response.statusCode != 200) {
        return Left(Failure(response.data, response.statusCode));
      } else {
        final model = ReceberPagar.fromJson(response.data);
        return Right(model);
      }
    } on DioError catch (e) {
      if (e.response == null) {
        return Left(Failure('Falha ao comunicar-se com o servidor', 500));
      }

      return Left(Failure(e.message, e.response.statusCode));
    } catch (e) {
      return Left(Failure(e.toString(), 500));
    }
  }
}
