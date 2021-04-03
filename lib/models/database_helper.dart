import 'package:postgres/postgres.dart';

class DatabaseHelper {
  DatabaseHelper._();
  static DatabaseHelper _instance;
  static DatabaseHelper get instance => _instance ?? DatabaseHelper._();

  Future<PostgreSQLConnection> connect() async {
    var connection = PostgreSQLConnection(
      '192.168.1.12',
      5432,
      'mobile_dashboard',
      username: 'postgres',
      password: '816425',
    );

    await connection.open();
    return connection;
  }

  void disconnect(PostgreSQLConnection connection) {
    connection.close();
  }
}
