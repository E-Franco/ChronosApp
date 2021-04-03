import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../stores/auth_store.dart';
import '../../login/login_view.dart';

class AppDrawer extends StatelessWidget {
  final authStore = GetIt.I<AuthStore>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(authStore.user.name),
              accountEmail: Text(authStore.user.email),
              currentAccountPicture: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 30,
                ),
                backgroundColor: Colors.white70,
              ),
            ),
            Spacer(),
            ListTile(
              title: Text(
                'Sair',
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF5555555),
                ),
              ),
              trailing: Icon(Icons.logout, size: 25),
              onTap: () async {
                bool answer = await showCupertinoDialog(
                  context: context,
                  builder: (_) => buildLogoutDialog(context),
                  barrierDismissible: true,
                );

                if (answer == true) {
                  authStore.logout();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => LoginView()),
                    (route) => false,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buildLogoutDialog(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text('Deseja sair?'),
      actions: [
        CupertinoDialogAction(
          child: Text('Não'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        CupertinoDialogAction(
          child: Text('Sim'),
          isDestructiveAction: true,
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}
