import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CatalogTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        // primaryTextTheme: GoogleFonts.latoTextTheme(),
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          titleTextStyle: TextStyle(color: Colors.black),
          iconTheme: IconThemeData(color: Colors.black),
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

// Colors
  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkBluishColor = const Color(0xff403b58);
}
