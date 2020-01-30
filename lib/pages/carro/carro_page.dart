import 'package:flutter/material.dart';

import 'carro.dart';

class CarroPage extends StatelessWidget {
  Carro carro;

  CarroPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.place),
            onPressed: _conClickMap,
          ),
          IconButton(
            icon: Icon(Icons.video_call),
            onPressed: _conClickVideo,
          ),
          PopupMenuButton<String>(
            //onSelected: (String value) => _onClickItemPopupMenu(value),
            onSelected: _onClickItemPopupMenu,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(value: "Editar", child: Text("Editar")),
                PopupMenuItem(value: "Deletar", child: Text("Deletar")),
                PopupMenuItem(value: "Share", child: Text("Share")),
              ];
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${carro.nome}",
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0, left: 8.0),
            child: Text(
              carro.descricao,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 8.0, left: 8.0),
            child: Text(
              carro.tipo,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Image.network(
            carro.urlFoto ??
                "https://storage.googleapis.com/carros-flutterweb.appspot.com/image_picker678672437640469084.jpeg",
          ),
        ],
      ),
    );
  }

  void _conClickMap() {}

  void _conClickVideo() {}

  _onClickItemPopupMenu(String value) {
    switch (value) {
      case "Editar":
        print("Editar !!!");
        break;
      case "Deletar":
        print("Deletar !!!");
        break;
      case "Share":
        print("Share !!!");
        break;
    }
  }
}
