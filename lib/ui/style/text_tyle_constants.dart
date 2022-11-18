import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:security_app/ui/style/app_colors.dart';

class TextStyleConstants {
  const TextStyleConstants();
  static const FontWeight titleFontWeigth = FontWeight.w700;
  static const FontWeight _medium = FontWeight.w400;

  static TextStyle kHeading1 = GoogleFonts.poppins(
    fontSize: 46.0,
    color: AppColors.duneGrey,
    fontWeight: titleFontWeigth,
    letterSpacing: 0.15,
  );

  static TextStyle kHeading2 = GoogleFonts.poppins(
    fontSize: 28.0,
    color: AppColors.duneGrey,
    fontWeight: titleFontWeigth,
    letterSpacing: 0.15,
  );

  static TextStyle kHeading3 = GoogleFonts.poppins(
    fontSize: 24.0,
    color: AppColors.duneGrey,
    fontWeight: titleFontWeigth,
    letterSpacing: 0.15,
  );

  static TextStyle kHeading4 = GoogleFonts.poppins(
    fontSize: 20.0,
    color: AppColors.duneGrey,
    fontWeight: titleFontWeigth,
    letterSpacing: 0.15,
  );

  static TextStyle kHeading5 = GoogleFonts.poppins(
    fontSize: 18.0,
    color: AppColors.duneGrey,
    fontWeight: titleFontWeigth,
    letterSpacing: 0.15,
  );

  static TextStyle kHeading6 = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.duneGrey,
    fontWeight: titleFontWeigth,
    letterSpacing: 0.15,
  );

  static TextStyle kSubtitle1 = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kSubtitle2 = GoogleFonts.poppins(
    fontSize: 14.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kSubtitle3 = GoogleFonts.poppins(
    fontSize: 12.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kSubtitle4 = GoogleFonts.poppins(
    fontSize: 10.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kBody1 = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kBody2 = GoogleFonts.poppins(
    fontSize: 14.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kBody3 = GoogleFonts.poppins(
    fontSize: 12.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kBody4 = GoogleFonts.poppins(
    fontSize: 10.0,
    color: AppColors.duneGrey,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );

  static TextStyle kButtonNormal = GoogleFonts.poppins(
    fontSize: 18.0,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );
  static TextStyle kButtonMedium = GoogleFonts.poppins(
    fontSize: 16.0,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );
  static TextStyle kButtoSmall = GoogleFonts.poppins(
    fontSize: 14.0,
    fontWeight: _medium,
    letterSpacing: 0.15,
  );
}
