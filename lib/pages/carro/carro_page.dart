import 'package:carros/widgets/lorem_ipsum.dart';
import 'package:carros/widgets/show_text.dart';
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
      child: ListView(
        children: <Widget>[
          Image.network(
            carro.urlFoto ??
                "https://storage.googleapis.com/carros-flutterweb.appspot.com/image_picker678672437640469084.jpeg",
          ),
          _blocoOne(),
          _blocoTwo(),
          Divider(),
        ],
      ),
    );
  }

  _blocoOne() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            showText(carro.nome, fontSize: 20, bold: true),
            showText(carro.tipo, fontSize: 16),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: Colors.red,
                size: 32,
              ),
              onPressed: () => _onClickIconFavorits(),
            ),
            IconButton(
              icon: Icon(
                Icons.share,
                color: Colors.black38,
                size: 32,
              ),
              onPressed: () => _onClickIconFavorits(),
            )
          ],
        )
      ],
    );
  }

  _blocoTwo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 16,
        ),
        showText(carro.descricao, fontSize: 18, bold: true),
        SizedBox(
          height: 8,
        ),
        showText(LoremIpsum().oneSection, fontSize: 16),
      ],
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

  _onClickIconFavorits() {}
}
