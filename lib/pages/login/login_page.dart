import 'package:carros/pages/carro/home_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/utils/show_dialog.dart';
import 'package:carros/widgets/app_button.dart';
import 'package:carros/widgets/app_text_form_field.dart';
import 'package:flutter/material.dart';

import 'login_api.dart';
import '../../utils/login_api_response.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controleLogin = TextEditingController();

  final controleSenha = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _focusSenha = FocusNode();

  bool _showProgress = false;

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
            AppTextFormField(
              "LOGIN",
              "Login",
              controller: controleLogin,
              validator: _validateLogin,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              focusNext: _focusSenha,
            ),
            SizedBox(height: 16),
            AppTextFormField(
              "SENHA",
              "Senha",
              obscureText: true,
              controller: controleSenha,
              validator: _validateSenha,
              keyboardType: TextInputType.number,
              focusNode: _focusSenha,
            ),
            SizedBox(height: 16),
            AppButton(
              "LOGIN",
              onPressed: _onClickLogin,
              showProgress: _showProgress,
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    String login = controleLogin.text;
    String senha = controleSenha.text;

    // controleLogin.text = novo nome
    print("Login: $login senha: $senha");

    setState(() {
      _showProgress = true;
    });

    LoginApiResponse response = await LoginApi.login(login, senha);

    if (response.ok) {
      push(context, HomePage(), replace: true);
    } else {
      alertDialog(context, response.msg);

      setState(() {
        _showProgress = false;
      });
    }

    _showProgress = false;
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
    if (value.length < 3) {
      return "Min 4 caracteres";
    }
    return null;
  }
}
