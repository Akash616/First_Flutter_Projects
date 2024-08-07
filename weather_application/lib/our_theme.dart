import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:weather_application/consts/colors.dart';

class CustomThemes {
  static final lightTheme = ThemeData(  //static bec. we have to access lightTheme var.
    cardColor: Colors.white,
    fontFamily: "poppins",
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Vx.gray800,
    iconTheme: IconThemeData(
      color: Vx.gray600
    ),
  );
  static final darkTheme = ThemeData(
    cardColor: cardColor,
    fontFamily: "poppins",
    scaffoldBackgroundColor: bgColor,
    primaryColor: Colors.white,
    iconTheme: IconThemeData(
      color: Colors.white
    ),
  );
}