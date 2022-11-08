import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mix/mix.dart';

class WaveTheme extends InheritedWidget {
  const WaveTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final WaveThemeData data;

  @override
  bool updateShouldNotify(covariant WaveTheme oldWidget) {
    return data != oldWidget.data;
  }
}

class WaveThemeData {
  final color = WaveColor();
  final typography = WaveTypography();
}

class WaveColor {
  final brand = const Color(0xFF295CF6);
  final neutralDark = const Color(0xFF1B1B27);
  final neutralMedium = const Color(0xFFA4A4A9);
  final neutralLight = const Color(0xFFEDEDEE);
  final neutralLightest = const Color(0xFFFFFFFF);
}

class WaveTypography {
  final heading1 = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  final heading2 = GoogleFonts.poppins(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  final heading3 = GoogleFonts.poppins(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  final subtitle1 = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  final subtitle2 = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  final description = GoogleFonts.poppins(
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
}
