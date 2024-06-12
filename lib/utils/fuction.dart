import 'package:flutter/material.dart';


//Text customText() {}

TextStyle customTextStyle({
  Color color = Colors.white,
  double fontSize = 18.0,
  FontWeight fontWeight = FontWeight.normal,
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: 'Roboto',
    fontWeight: fontWeight,
  );
}
