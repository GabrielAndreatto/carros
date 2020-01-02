import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
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
      child: Container(
        child: Text(
          "App Carros",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
