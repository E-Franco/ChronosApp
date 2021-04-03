import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/failure.dart';
import '../models/user.dart';
import '../repositories/user_repository.dart';
import '../utils/dio_service.dart';
import '../utils/toast_utils.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  _AuthStoreBase() {
    autorun((reation) {
      if (user != null) {
        storeUser();
        DioService dio = DioService(user);
        GetIt.I.registerSingleton(dio);
      }
    });
  }

  @observable
  User user;

  @observable
  String email;

  @observable
  String password;

  @observable
  bool isUserChecked = false;

  @action
  void changeEmail(String value) => email = value;

  @action
  void changePassword(String value) => password = value;

  @action
  void changeUser(User value) => user = value;

  @action
  Future<void> signIn() async {
    Either<Failure, User> result;

    result = await UserRepository.instance.signIn(email, password);
    result.fold(
      (l) => ToastUtils.showErrorToast(l.message),
      (r) => user = r,
    );
  }

  @action
  void storeUser() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString('user', jsonEncode(user));
    });
  }

  @action
  Future<void> checkUser() async {
    final prefs = await SharedPreferences.getInstance();
    final json = prefs.getString('user');
    if (json != null) {
      final data = jsonDecode(json);
      user = User.fromJson(data);
    }

    isUserChecked = true;
  }

  @action
  void logout() {
    SharedPreferences.getInstance().then((prefs) {
      prefs.remove('user');
      user = null;
      password = null;
      email = null;
      isUserChecked = false;
    });
  }
}
