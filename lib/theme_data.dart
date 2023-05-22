import 'package:flutter/material.dart';

Color? lightGrey = Colors.grey[200];
Color? lightYellow = Colors.yellow[400];
Color grey = Colors.grey;
Color yellow = Colors.yellow;
Color darkYellow = const Color(0xff625918);
Color black = Colors.black;

final yellowGrayBlackTheme = ThemeData(
  primaryColor: yellow,
  primaryColorLight: lightYellow,
  primaryColorDark: darkYellow,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    color: yellow,
    iconTheme: const IconThemeData(color: Colors.black),
    titleTextStyle: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  listTileTheme: ListTileThemeData(
    tileColor: Colors.white,
    iconColor: yellow,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    selectedItemColor: black,
    unselectedItemColor: grey,
  ),
);
