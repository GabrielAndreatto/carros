import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final controleLogin = TextEditingController();
  final controleSenha = TextEditingController();

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
          _textFormField(
            "LOGIN",
            "Login",
            controller: controleLogin,
          ),
          SizedBox(height: 16),
          _textFormField(
            "SENHA",
            "Senha",
            obscureText: true,
            controller: controleSenha,
          ),
          SizedBox(height: 16),
          Container(
            margin: EdgeInsets.only(top: 8),
            height: 46,
            child: _raisedButton(
              "LOGIN",
              () {
                _onClickLogin();
              },
            ),
          ),
        ],
      ),
    );
  }

  TextFormField _textFormField(String param, String hint,
      {bool obscureText = false, TextEditingController controller}) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: param,
        hintText: hint,
      ),
    );
  }

  RaisedButton _raisedButton(String name, Function onPressed) {
    return RaisedButton(
      color: Colors.blue,
      child: Text(
        name,
        style: TextStyle(
          color: Colors.white,
          fontSize: 22,
        ),
      ),
      onPressed: onPressed,
    );
  }

  _onClickLogin() {
    String login = controleLogin.text;
    String senha = controleSenha.text;

    // controleLogin.text = novo nome
    print("Login: $login senha: $senha");
  }
}
