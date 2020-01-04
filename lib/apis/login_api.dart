import 'dart:convert';
import 'package:carros/models/usuario.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future<Usuario> login(String login, String senha) async {
    var url = "https://carros-springboot.herokuapp.com/api/v2/login";

    Map<String, String> headers = {"content-type": "application/json"};

    Map params = {
      "username": "admin",
      "password": "123",
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

    Usuario user = Usuario.fromJson(mapResponse);

    return user;
  }
}
