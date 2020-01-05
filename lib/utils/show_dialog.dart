import 'package:flutter/material.dart';

alertDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return WillPopScope(
        onWillPop: () async => false,
        child: AlertDialog(
          title: Text("Carros"),
          content: Text(msg),
          actions: <Widget>[
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
                print("Ok");
              },
              child: Text("Ok"),
            ),
          ],
        ),
      );
    },
  );
}
