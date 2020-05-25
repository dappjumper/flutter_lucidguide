import 'package:flutter/material.dart';

const headerColor = primaryBlack;
const bodyColor = Colors.black54;

const MaterialColor primaryBlack = MaterialColor(
  _blackPrimaryValue,
  <int, Color>{
    50: Color(_blackPrimaryValue),
    100: Color(_blackPrimaryValue),
    200: Color(_blackPrimaryValue),
    300: Color(_blackPrimaryValue),
    400: Color(_blackPrimaryValue),
    500: Color(_blackPrimaryValue),
    600: Color(_blackPrimaryValue),
    700: Color(_blackPrimaryValue),
    800: Color(_blackPrimaryValue),
    900: Color(_blackPrimaryValue),
  },
);
const int _blackPrimaryValue = 0xFF111111;

TextStyle headline =
TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32);

TextStyle buttonText =
TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 22);

TextStyle buttonTextUnderline = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.normal,
    fontSize: 22,
    decoration: TextDecoration.underline);

TextStyle subtitle =
TextStyle(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 25);