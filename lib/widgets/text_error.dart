import 'package:flutter/material.dart';

class TextError extends StatelessWidget {
  String testError;

  TextError(this.testError);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "$testError ...",
        style: TextStyle(
          color: Colors.red,
          fontSize: 22,
        ),
      ),
    );
  }
}
