import 'package:dio/dio.dart';

import '../models/user.dart';

class DioService {
  Dio dio;

  DioService(User user) {
    final url = 'http://${user.host}:${user.port}';
    dio = this.createDio(baseUrl: url);
  }

  Dio get instance => this.dio;

  Dio createDio({String baseUrl}) {
    return Dio(
      BaseOptions(
        connectTimeout: 10000,
        receiveTimeout: 10000,
        sendTimeout: 10000,
        baseUrl: baseUrl,
      ),
    );
  }
}
