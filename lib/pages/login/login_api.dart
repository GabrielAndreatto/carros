import 'dart:convert';
import 'package:carros/pages/login/usuario.dart';
import 'package:carros/utils/prefs.dart';
import 'package:http/http.dart' as http;
import '../../utils/login_api_response.dart';

class LoginApi {
  static Future<LoginApiResponse<Usuario>> login(
      String login, String senha) async {
    try {
      var url = "https://carros-springboot.herokuapp.com/api/v2/login";

      Map<String, String> headers = {"content-type": "application/json"};

      Map params = {
        "username": login,
        "password": senha,
      };
      String s = json.encode(params);
      print(" > $s");

      var response = await http.post(
        url,
        body: s,
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      Map mapResponse = json.decode(response.body);

      if (response.statusCode == 200) {
        final user = Usuario.fromJson(mapResponse);
        user.save();
        return LoginApiResponse.ok(user);
      }

      return LoginApiResponse.error(mapResponse["error"]);
    } catch (error, exception) {
      print("Erro no login $error > $exception");
    }

    return LoginApiResponse.error("Não foi possivel fazer o login.");
  }
}
