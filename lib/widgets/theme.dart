import 'package:flutter/material.dart';
import './const.dart'as cons;

ThemeData appTheme(){
  return ThemeData(
    primaryColor:cons.cMainColor,
    accentColor:cons.cBackgroundColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: cons.cBackgroundColor),
    splashColor: cons.cBackgroundColor,
    fontFamily: cons.cDefaultFontFamily,
    textTheme: TextTheme(
      caption: TextStyle(color: cons.cMainColor),
      subtitle1:TextStyle(color: cons.cMainColor),
      button: TextStyle (color:cons.cFontColor),
      bodyText2: TextStyle(color: cons.cMainColor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: cons.cMainColor.withOpacity(0.9),
      splashColor: Color(0xff29A0B1),
    ),
  );
}
