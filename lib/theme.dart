import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      primary: Color(0xff000000),
      primaryVariant: Color(0xff53A35B),
      secondary: Color(0xffDB5050),
      secondaryVariant: Color(0xff4E7EDB),
      surface: Color(0xffeeeeee),
      error: Color(0xffDB5050),
      background: Color(0xffffffff),
      onError: Color(0xffDB5050),
      onBackground: Color(0xffffffff),
      onSecondary: Color(0xffDB5050),
      onPrimary: Color(0xff000000),
      onSurface: Color(0xffeeeeee),
      brightness: Brightness.light,
    ),
    buttonColor: Color(0xff808080),
    backgroundColor: Color(0xffffffff),
    textTheme: TextTheme(
      body1: TextStyle(
        fontFamily: "Poppins",
      ),
      body2: TextStyle(
        fontFamily: "Poppins",
      ),
      button: TextStyle(
        fontFamily: "Poppins",
      ),
      caption: TextStyle(
        fontFamily: "Poppins",
      ),
      display1: TextStyle(
        fontFamily: "Poppins",
      ),
      display2: TextStyle(
        fontFamily: "Poppins",
      ),
      display3: TextStyle(
        fontFamily: "Poppins",
      ),
      display4: TextStyle(
        fontFamily: "Poppins",
      ),
      overline: TextStyle(
        fontFamily: "Poppins",
      ),
      headline: TextStyle(
        fontFamily: "Poppins",
      ),
      subhead: TextStyle(
        fontFamily: "Poppins",
      ),
      subtitle: TextStyle(
        fontFamily: "Poppins",
      ),
      title: TextStyle(
        fontFamily: "Poppins",
      ),
    ),
  );
}
