import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  static ThemeData theme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.poppinsTextTheme(),
  );
}
