import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobile_dashboard/models/failure.dart';
import 'package:mobile_dashboard/models/forma_pago.dart';
import 'package:mobile_dashboard/utils/dio_service.dart';

class FormaPagoRepository {
  FormaPagoRepository._();
  static FormaPagoRepository _instance;
  static FormaPagoRepository get instance => _instance ??= FormaPagoRepository._();

  final dioService = GetIt.I<DioService>();
  final String baseUrl = '/apis/forma_pago';

  Future<Either<Failure, List<FormaPago>>> byDay() async {
    try {
      final response = await dioService.dio.get('$baseUrl?fp=0');
      if (response.statusCode != 200) {
        return Left(
          Failure(response.data, response.statusCode),
        );
      } else {
        final pagos = (response.data as List).map<FormaPago>((e) => FormaPago.fromJson(e)).toList();
        return Right(pagos);
      }
    } on DioError catch (e) {
      return Left(Failure(e.message, e.response.statusCode));
    } catch (e) {
      return Left(Failure(e.toString(), 500));
    }
  }

  Future<Either<Failure, List<FormaPago>>> byWeek() async {
    try {
      final response = await dioService.dio.get('$baseUrl?fp=1');
      if (response.statusCode != 200) {
        return Left(Failure(response.data, response.statusCode));
      } else {
        final pagos = (response.data as List).map<FormaPago>((e) => FormaPago.fromJson(e)).toList();
        return Right(pagos);
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

  Future<Either<Failure, List<FormaPago>>> byPeriod(DateTime start, DateTime end) async {
    try {
      final formattedStart = DateFormat('yyyy-MM-dd').format(start);
      final formattedEnd = DateFormat('yyyy-MM-dd').format(end);
      final url = '$baseUrl?fp=2&inicio=$formattedStart&final=$formattedEnd';

      final response = await dioService.dio.get(url);
      if (response.statusCode != 200) {
        return Left(
          Failure(response.data, response.statusCode),
        );
      } else {
        final pagos = (response.data as List).map<FormaPago>((e) => FormaPago.fromJson(e)).toList();
        return Right(pagos);
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
