import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles{
  static TextStyle kDisplayLarge = GoogleFonts.nunito(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kHeadingMedium = GoogleFonts.nunito(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kHeadingSmall = GoogleFonts.nunito(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kLabelLarge = GoogleFonts.nunito(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: ColorsConstant.onPrimaryWhiteColor,
  );

  static TextStyle kBodyLarge = GoogleFonts.nunito(
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    color: ColorsConstant.onPrimaryWhiteColor,
  );
}