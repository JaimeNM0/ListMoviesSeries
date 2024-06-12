import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color colorWhiteBorder = Color.fromARGB(255, 201, 200, 200);
const Color colorPurple = Color.fromRGBO(76, 32, 96, 1);
const LinearGradient linearGradientFading = LinearGradient(
  colors: <Color>[
    Color.fromRGBO(252, 92, 92, 1),
    Color.fromRGBO(252, 68, 172, 1),
    Color.fromRGBO(228, 84, 244, 1),
    Color.fromRGBO(156, 84, 244, 1),
  ],
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
);

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

String changeFormatDate(String dateString) {
  DateTime date = DateTime.parse(dateString);
  DateFormat format = DateFormat('dd-MM-yyyy');
  String formattedDate = format.format(date);
  return formattedDate;
}