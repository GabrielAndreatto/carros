import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Carros"),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView(
        children: <Widget>[
          Text("Login"),
          TextFormField(),
          SizedBox(height: 16),
          Text("Senha"),
          TextFormField(
            obscureText: true,
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 46,
            child: RaisedButton(
              color: Colors.blue,
              child: Text(
                "Clicar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                ),
              ),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
