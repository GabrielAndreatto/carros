import 'package:carros/pages/login_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Gabriel Andreattto"),
              accountEmail: Text("gabriel.andreatto.1@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Image.asset("assets/images/avatares/avatar7.png"),
              ),
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
    Navigator.pop(context);
    push(context, LoginPage(), replace: true);
  }
}
