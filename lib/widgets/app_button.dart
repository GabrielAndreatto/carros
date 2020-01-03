import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String name;
  Function onPressed;

  AppButton(this.name, {this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: Text(
          name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
