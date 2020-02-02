import 'dart:async';

import 'carro.dart';
import 'carro_api.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  Future<List<Carro>> fetch(String tipoCarros) async {
    try {
      List<Carro> carros = await CarroApi.getCarros(tipoCarros);
      _streamController.add(carros);

      return carros;
    } catch (e) {
      _streamController.addError(e);
      print(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
