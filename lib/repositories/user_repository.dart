import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:mobile_dashboard/models/failure.dart';
import 'package:mobile_dashboard/models/user.dart';

class UserRepository {
  UserRepository._();
  static UserRepository _instance;
  static UserRepository get instance => _instance ??= UserRepository._();

  Future<Either<Failure, User>> signIn(String email, String password) async {
    try {
      final dio = Dio();
      final response = await dio.get('http://167.172.133.4:6060/users/auth?login=$email&mobile_auth=$password');
      if (response.statusCode == 200) {
        var user = User.fromJson(response.data);
        return Right(user);
      } else if (response?.statusCode == 401) {
        throw 'E-mail e/ou senha incorretos';
      } else {
        throw 'Falha ao comunicar-se com o servidor';
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
