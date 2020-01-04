import 'package:flutter/material.dart';

Future push(BuildContext context, Widget page) {
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
