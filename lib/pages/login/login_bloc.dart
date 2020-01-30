import 'dart:async';

import 'package:carros/pages/login/login_api.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/login_api_response.dart';

class LoginBloc {
  final _streamController = StreamController<bool>();

  get stream => _streamController.stream;

  Future<LoginApiResponse<Usuario>> login(String login, String senha) async {
    _streamController.add(true);
    LoginApiResponse response = await LoginApi.login(login, senha);
    _streamController.add(false);
    return response;
  }

  void dispose() {
    _streamController.close();
  }
}
