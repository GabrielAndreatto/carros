import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final controleLogin = TextEditingController();
  final controleSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            _textFormField(
              "LOGIN",
              "Login",
              controller: controleLogin,
              validator: _validateLogin,
            ),
            SizedBox(height: 16),
            _textFormField(
              "SENHA",
              "Senha",
              obscureText: true,
              controller: controleSenha,
              validator: _validateSenha,
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
      ),
    );
  }

  TextFormField _textFormField(
    String param,
    String hint, {
    bool obscureText = false,
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: param,
        hintText: hint,
      ),
      obscureText: obscureText,
      validator: validator,
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
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = controleLogin.text;
    String senha = controleSenha.text;

    // controleLogin.text = novo nome
    print("Login: $login senha: $senha");
  }

  String _validateLogin(String value) {
    if (value.isEmpty) {
      return "Digite o login";
    }
    return null;
  }

  String _validateSenha(String value) {
    if (value.isEmpty) {
      return "Digite a senha";
    }
    if (value.length < 4) {
      return "Min 4 caracteres";
    }
    return null;
  }
}
