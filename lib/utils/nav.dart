import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page, {bool replace = false}) {
  if (replace) {
    return Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext buildContext) {
          return page;
        },
      ),
    );
  }

  return Navigator.push(
    context,
    MaterialPageRoute(
      builder: (BuildContext buildContext) {
        return page;
      },
    ),
  );
}

pop(BuildContext context, returning) {
  Navigator.pop(context, returning);
}
