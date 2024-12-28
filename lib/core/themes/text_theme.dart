import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeHandler {
  static TextStyle titleStyle() {
    return TextStyle(
      fontFamily: GoogleFonts.ysabeauSc().fontFamily,
      color: Colors.black54,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle descriptionStyle() {
    return TextStyle(
      fontFamily: GoogleFonts.ysabeauSc().fontFamily,
      fontSize: 14,
    );
  }

  static TextStyle priceStyle() {
    return TextStyle(
      fontFamily: GoogleFonts.roboto().fontFamily,
      fontSize: 20,
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle ratingStyle() {
    return TextStyle(
      fontSize: 15,
      fontFamily: GoogleFonts.roboto().fontFamily,
    );
  }

  static TextStyle sizeLabelStyle() {
    return TextStyle(
      fontSize: 16,
      fontFamily: GoogleFonts.roboto().fontFamily,
    );
  }

  static TextStyle sizeOptionStyle() {
    return TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.bold,
    );
  }
}
