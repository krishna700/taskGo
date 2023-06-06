// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Global theme class for the app

//Primary color of the app
const Color primaryColor = Colors.blue;

class AppTheme {
  static const Color lightRed = Color.fromARGB(255, 229, 126, 126);
  static const Color red = Color.fromARGB(255, 255, 120, 110);
  static const LinearGradient redGradient = LinearGradient(
    colors: [lightRed, red],
  );

  static const Color lightOrange = Color.fromARGB(255, 255, 217, 130);
  static const Color orange = Color.fromARGB(255, 231, 172, 118);
  static const LinearGradient darkOrangeGradient = LinearGradient(
    colors: [lightOrange, orange],
  );

  static const Color lightGreen = Color.fromARGB(255, 109, 203, 112);
  static const Color green = Color.fromARGB(255, 112, 255, 117);
  static const LinearGradient greenGradient = LinearGradient(
    colors: [lightGreen, green],
  );

  static const Color greyBlue = Color(0xFF5581F1);
  static const Color darkBlue = Color.fromARGB(255, 138, 170, 252);
  static const LinearGradient darkBlueGradient = LinearGradient(
    colors: [greyBlue, darkBlue],
  );
  static const Color boldColorFont = Color(0xFF2A2E49);
  static const Color normalColorFont = Color(0xFFa2a1ae);

  static const TextStyle headline1 = TextStyle(
    fontSize: 28,
    color: boldColorFont,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headline2 = TextStyle(
    fontSize: 26,
    color: boldColorFont,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headline3 = TextStyle(
    fontSize: 20,
    color: boldColorFont,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle text1 = TextStyle(
    fontSize: 16,
    color: normalColorFont,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle text3 = TextStyle(
    fontSize: 14,
    color: normalColorFont,
    fontWeight: FontWeight.w500,
  );

  static List<BoxShadow> getShadow(Color color) {
    return [
      BoxShadow(
        color: color.withOpacity(0.3),
        offset: const Offset(0, 6),
        blurRadius: 10,
        spreadRadius: 2,
      ),
    ];
  }

  ///Returns a Light Theme which is passed as initial theme to the main app.
  static ThemeData getLightTheme() {
    return ThemeData.light().copyWith(
      //Primary color of the app
      primaryColor: primaryColor,
      accentColor: Colors.black,
      accentColorBrightness: Brightness.dark,
      toggleableActiveColor: Colors.orange[100],
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
