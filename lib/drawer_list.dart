import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

import 'pages/login/login_page.dart';

class DrawerList extends StatelessWidget {
  UserAccountsDrawerHeader _headers(Usuario user) {
    return UserAccountsDrawerHeader(
      accountName: Text(user.nome),
      accountEmail: Text(user.email),
      currentAccountPicture: CircleAvatar(
        child: Image.network(user.urlFoto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<Usuario> future = Usuario.get();

    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            FutureBuilder<Usuario>(
              future: future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Usuario user = snapshot.data;
                return user != null ? _headers(user) : Container();
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text("Favoritos"),
              subtitle: Text("Marcar favoritos !"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item Favoritos.");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.help),
              title: Text("Ajuda"),
              subtitle: Text("Solicitar ajuda !"),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                print("Item Ajuda.");
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              subtitle: Text("Logout"),
              trailing: Icon(Icons.arrow_downward),
              onTap: () => _conClickLogout(context),
            ),
          ],
        ),
      ),
    );
  }

  _conClickLogout(BuildContext context) {
    Usuario.clear();
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
