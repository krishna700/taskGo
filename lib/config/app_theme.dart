// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Global theme class for the app

class AppTheme {
  ///Returns a Light Theme which is passed as initial theme to the main app.
  static ThemeData getLightTheme() {
    return ThemeData.light().copyWith(
      //Primary color of the app
      primaryColor: Colors.white,
      accentColor: Colors.black,
      accentColorBrightness: Brightness.dark,
      toggleableActiveColor: Colors.blue[900],
      bottomAppBarColor: Colors.white,
      accentIconTheme: const IconThemeData(color: Colors.black),
      appBarTheme:
          const AppBarTheme(brightness: Brightness.light, elevation: 1),
      primaryColorBrightness: Brightness.light,
      primaryColorDark: Colors.black87,
      primaryIconTheme: const IconThemeData(color: Colors.black),
      brightness: Brightness.light,
      cardColor: Colors.white,
      backgroundColor: Colors.grey[200],
      dialogBackgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: const ColorScheme.light(onPrimary: Colors.black),

      //Primary font of the app
      primaryTextTheme: GoogleFonts.latoTextTheme(ThemeData.light().textTheme),
      accentTextTheme:
          GoogleFonts.latoTextTheme(ThemeData.light().accentTextTheme),
      textTheme: GoogleFonts.latoTextTheme(
        ThemeData.light().textTheme.copyWith(
              caption: ThemeData.light().textTheme.caption!.copyWith(
                  color: Colors.black54,
                  fontSize: 10,
                  fontWeight: FontWeight.w500),
              bodyText2: ThemeData.light().textTheme.bodyText2!.copyWith(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
              bodyText1: ThemeData.light().textTheme.bodyText1!.copyWith(
                  color: Colors.black,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
            ),
      ),
    );
  }
}
