import 'package:flutter/material.dart';

Text showText(
  String s, {
  double fontSize = 16,
  color: Colors.black,
  bold: false,
  maxLines: 250,
  overflow: TextOverflow.ellipsis,
}) {
  return Text(
    s ?? "",
    style: TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: bold ? FontWeight.bold : FontWeight.normal,
    ),
    maxLines: maxLines,
    overflow: overflow,
  );
}
