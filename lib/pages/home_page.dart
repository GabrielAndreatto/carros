import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
    return Center(
      child: Text(
        "List cars home page ...",
        style: TextStyle(
          fontSize: 30,
          color: Colors.grey,
        ),
      ),
    );
  }
}
