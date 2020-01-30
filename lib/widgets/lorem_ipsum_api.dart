import 'dart:async';

import 'package:http/http.dart' as http;

class LoremIpsumApi {
  static Future<String> getLoremIpsum() async {
    var url = 'https://loripsum.net/api';

    print("Get > $url");

    var response = await http.get(url);

    String text = response.body;

    text = text.replaceAll("<p>", "");
    text = text.replaceAll("</p>", "");

    return text;
  }
}

class LoremIpsumApiBloc {
  final _streamController = StreamController<String>();

  static String lorim;

  get stream => _streamController.stream;

  void fetch() async {
    try {
      String s = lorim ?? await LoremIpsumApi.getLoremIpsum();
      lorim = s;
      _streamController.add(s);
    } catch (e) {
      _streamController.addError(e);
      print(e);
    }
  }

  void dispose() {
    _streamController.close();
  }
}
