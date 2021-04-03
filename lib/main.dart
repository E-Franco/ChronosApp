import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';

import 'stores/auth_store.dart';
import 'stores/faturamento_store.dart';
import 'stores/forma_pago_store.dart';
import 'stores/receber_pagar_store.dart';
import 'ui/home/home_view.dart';
import 'ui/login/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Intl.defaultLocale = 'pt_BR';
  registerSingletons();
  runApp(App());
}

class App extends StatelessWidget {
  final authStore = GetIt.I<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', ''),
        const Locale('pt', 'BR'),
        const Locale('en', ''),
      ],
      home: Observer(
        builder: (_) {
          if (!authStore.isUserChecked) {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (authStore.user != null) {
            return HomeView();
          }

          return LoginView();
        },
      ),
    );
  }
}

void registerSingletons() {
  final getIt = GetIt.instance;
  final authStore = AuthStore()..checkUser();

  getIt.registerSingleton(authStore);
  getIt.registerSingleton(FaturamentoStore());
  getIt.registerSingleton(FormaPagoStore());
  getIt.registerSingleton(ReceberPagarStore());
}
