import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get_it/get_it.dart';
import '../../stores/auth_store.dart';
import '../home/home_view.dart';
import 'widgets/auth_styles.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final auth = GetIt.I<AuthStore>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height / 6,
              horizontal: 30,
            ),
            children: [
              Container(
                width: 150,
                height: 150,
                padding: EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(),
                child: Image.asset(
                  'assets/logo.png',
                  color: Colors.blue,
                ),
              ),
              SizedBox(height: 50),
              TextFormField(
                onChanged: auth.changeEmail,
                style: TextStyle(fontSize: 16),
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: AuthStyles.unfocusedBorder,
                  focusedBorder: AuthStyles.focusedBorder,
                  errorBorder: AuthStyles.errorBorder,
                  focusedErrorBorder: AuthStyles.errorBorder,
                  hintText: 'E-mail',
                ),
                validator: MultiValidator([
                  RequiredValidator(errorText: 'Digite seu e-mail de acesso'),
                  EmailValidator(errorText: 'E-mail inválido'),
                ]),
                textInputAction: TextInputAction.next,
              ),
              SizedBox(height: 15),
              TextFormField(
                cursorColor: Theme.of(context).primaryColor,
                style: TextStyle(fontSize: 16),
                textInputAction: TextInputAction.done,
                onChanged: auth.changePassword,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: AuthStyles.unfocusedBorder,
                  focusedBorder: AuthStyles.focusedBorder,
                  errorBorder: AuthStyles.errorBorder,
                  focusedErrorBorder: AuthStyles.errorBorder,
                  hintText: 'Senha',
                ),
                validator: RequiredValidator(errorText: 'Campo obrigatório'),
                onFieldSubmitted: (_) => signIn(),
              ),
              SizedBox(height: 30),
              Container(
                height: 45,
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width / 5),
                child: Observer(
                  builder: (_) {
                    bool enabled = auth.password != null && auth.email != null;

                    return ElevatedButton(
                      child: Text('Continuar'),
                      onPressed: enabled ? signIn : null,
                      style: ElevatedButton.styleFrom(
                        shape: const StadiumBorder(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void signIn() async {
    if (formKey.currentState.validate()) {
      print(123);
      FocusScope.of(context).unfocus();
      showLoadingDialog();
      await auth.signIn();
      Navigator.of(context).pop();
      if (auth.user != null) {
        Future.delayed(Duration(seconds: 1));
        Navigator.of(context).push(CupertinoPageRoute(builder: (_) => HomeView()));
      }
    }
  }

  void showLoadingDialog() {
    showDialog(
      context: context,
      builder: (_) => WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
