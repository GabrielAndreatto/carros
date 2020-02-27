import 'dart:async';

import 'package:carros/pages/favoritos/carro_dao.dart';
import 'package:carros/utils/network.dart';

import 'carro.dart';
import 'carro_api.dart';

class CarrosBloc {
  final _streamController = StreamController<List<Carro>>();

  get stream => _streamController.stream;

  Future<List<Carro>> fetch(String tipoCarros) async {
    try {
      if (await isNetworkOn()) {
        print("! isNetworkOn");
        List<Carro> carros = await CarroDAO().findAllByTipo(tipoCarros);
        _streamController.add(carros);
        return carros;
      }

      List<Carro> carros = await CarroApi.getCarros(tipoCarros);

      if (carros.isNotEmpty) {
        final dao = CarroDAO();
        carros.forEach(dao.save);
      }
      _streamController.add(carros);

      return carros;
    } catch (e) {
      print(e);
      if (!_streamController.isClosed) {
        _streamController.addError(e);
      }
    }
  }

  void dispose() {
    _streamController.close();
  }
}
