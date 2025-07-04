import 'package:flutter/material.dart';

class Pallete {
  static const LinearGradient bg = LinearGradient(
    colors: [
      Color.fromARGB(255, 158, 189, 220),
      Color.fromARGB(255, 255, 255, 255),
    ], // Adjust colors as needed
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const Color sideNav = Color(0xFF7191B2);
  static const Color icon = Color(0xFF7191B2);
  static const Color searchBar = Color.fromARGB(0, 53, 93, 134);
  static const Color mainfont = Color.fromARGB(0, 37, 66, 97);
  static const Color proButton = Color.fromARGB(255, 90, 121, 152);
  static const Color cardColor = Color.fromARGB(255, 54, 93, 132);
  static const Color footer = Color.fromARGB(255, 160, 195, 230);
  static const Color submitButton = Color.fromARGB(255, 90, 121, 152);
  static const searchBarBorder = Color.fromARGB(255, 46, 73, 99);
}
