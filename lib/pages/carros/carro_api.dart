import 'dart:convert' as convert;

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/login/usuario.dart';
import 'package:http/http.dart' as http;

class TipoCarro {
  static final String classicos = "classicos";
  static final String esportivos = "esportivos";
  static final String luxo = "luxo";
}

class CarroApi {
  static Future<List<Carro>> getCarros(String tipoCarro) async {
    Usuario user = await Usuario.get();
    Map<String, String> headers = {
      "content-type": "application/json",
      "Authorization": "Bearer ${user.token}",
    };

    var url =
        "https://carros-springboot.herokuapp.com/api/v2/carros/tipo/$tipoCarro";

    print(url);
    var response = await http.get(url, headers: headers);
    String json = response.body;
    List list = convert.json.decode(json);

    List<Carro> carros = list.map<Carro>((map) => Carro.fromMap(map)).toList();

    return carros;
  }
}
