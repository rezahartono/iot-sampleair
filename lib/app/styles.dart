import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  static TextStyle primary = GoogleFonts.roboto(
    color: AppColor.primary,
    fontStyle: FontStyle.normal,
  );
  static TextStyle secondary = GoogleFonts.roboto(
    color: AppColor.secondary,
    fontStyle: FontStyle.normal,
  );
}

class AppColor {
  static Color primary = const Color(0xFF000000);
  static Color secondary = const Color(0xFFFFFFFF);
  static Color darkBlue = const Color(0xFF2A4B7A);
  static Color lightBlue = const Color(0xFF77A9DF);
  static Color teal = const Color(0xFFA2FEC7);
  static Color red = Colors.red[900] ?? const Color(0xFFFF0000);
  static Color green = Colors.green[800] ?? const Color(0xFF00FF00);
}
