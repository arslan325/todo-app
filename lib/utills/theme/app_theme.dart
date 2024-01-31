import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/utills/constants/colors.dart';
import 'package:todo_app/utills/constants/text_styles.dart';

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  appBarTheme: const AppBarTheme(color: Colors.transparent,centerTitle: true),
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: ColorsConstant.primaryColor,
    onPrimary: ColorsConstant.onPrimaryWhiteColor,
    primaryContainer: ColorsConstant.primaryContainer,
    secondary: ColorsConstant.secondaryColor,
    onSecondary: ColorsConstant.onPrimaryWhiteColor,
    secondaryContainer: ColorsConstant.secondaryColor,
    error: ColorsConstant.kToolingErrorColor,
    onError: ColorsConstant.onPrimaryWhiteColor,
    background: ColorsConstant.primaryColor,
    onBackground: ColorsConstant.onPrimaryWhiteColor,
    surface: ColorsConstant.secondaryColor,
    onSurface: ColorsConstant.primaryColor,
  ),
  textTheme: GoogleFonts.nunitoSansTextTheme().copyWith(
    displayLarge: AppTextStyles.kDisplayLarge,
    headlineMedium: AppTextStyles.kHeadingMedium,
    headlineSmall: AppTextStyles.kHeadingSmall,
    labelLarge: AppTextStyles.kLabelLarge,
    bodyLarge: AppTextStyles.kBodyLarge,
  ),
);
