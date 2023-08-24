import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyConfig {
  static const String appName = 'Synapsis';
  static const String baseUrl = 'BASE_URL';

}
class ColorsBase{
static const colorPrimary = Color(0XFF356BB4);
static const colorPrimarySoft = Color(0XFF48B5E4);
static const whiteBase = Color(0XFFF2FAFD);
static const red = Color(0XFFFD6D6C);
static const blue = Color(0XFF006CF3);
static const yellow = Color(0XFFF2C94C);
static const green = Color(0XFF27AE60);
static const lightGrey =  Color(0xffBDBDBD);
static const grey = Color(0XFF888888);
static const darkGrey =  Color(0XFF444444);
}
class SpaceBase{
  /// Padding
  static const double paddingZero = 0.0;
  static const double paddingXS = 2.0;
  static const double paddingS = 4.0;
  static const double paddingM = 8.0;
  static const double paddingL = 16.0;
  static const double paddingXL = 32.0;
  static const double paddingXXL = 36.0;
  /// Margin
  static const double marginZero = 0.0;
  static const double marginXS = 2.0;
  static const double marginS = 4.0;
  static const double marginM = 8.0;
  static const double marginL = 16.0;
  static const double marginXL = 32.0;
  static const double marginXXL = 36.0;

}

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  useMaterial3: true,
  scaffoldBackgroundColor: ColorsBase.whiteBase,
  dividerColor: Colors.transparent,
  appBarTheme: const AppBarTheme(color: Colors.transparent),
  textTheme: GoogleFonts.poppinsTextTheme(),
  colorScheme: ColorScheme.fromSeed(seedColor: ColorsBase.colorPrimary),
  snackBarTheme: SnackBarThemeData(backgroundColor: ColorsBase.colorPrimary,contentTextStyle: GoogleFonts.poppins())
);


