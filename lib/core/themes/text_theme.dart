import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextThemeHandler {
  static TextStyle titleStyle() {
    return TextStyle(
      fontFamily: GoogleFonts.ysabeauSc().fontFamily,
      color: Colors.black54,
      fontSize: 15,
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
      fontSize: 15,
      color: Colors.redAccent,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle ratingStyle() {
    return TextStyle(
      fontSize: 13,
      fontFamily: GoogleFonts.roboto().fontFamily,
    );
  }

  static TextStyle sizeLabelStyle() {
    return TextStyle(
      fontSize: 14,
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
