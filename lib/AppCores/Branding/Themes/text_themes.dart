import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AssetsStrings/assetsurl.dart';

//Update textThemes Here

class AppTextThemesData {
  AppTextThemesData._();

  static TextTheme textTheme(BuildContext context, Size size, bool isDark) {
    return TextTheme(
      titleLarge: TextStyle(
          color: isDark ? AppColors.textDarkTheme : AppColors.textDarkTheme,
          fontWeight: FontWeight.bold,
          fontFamily: AppFontsUrl.primaryFonts,
          fontSize: size.width * .042),
      titleMedium: TextStyle(
        color: isDark
            ? AppColors.textVaraiantDarkTheme
            : AppColors.textVaraiantDarkTheme,
        fontWeight: FontWeight.w500,
        fontSize: size.width * .032,
      ),
      titleSmall: TextStyle(
        color: isDark
            ? AppColors.textVaraiantDarkTheme
            : AppColors.textVaraiantDarkTheme,
        fontWeight: FontWeight.w300,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .022,
      ),
      bodyLarge: TextStyle(
        color: isDark
            ? AppColors.textVaraiantDarkTheme
            : AppColors.textVaraiantDarkTheme,
        fontWeight: FontWeight.bold,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .042,
      ),
      bodyMedium: TextStyle(
        color:
            isDark ? AppColors.textVaraiantDarkTheme : AppColors.textDarkTheme,
        fontWeight: FontWeight.w400,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .035,
      ),
      bodySmall: TextStyle(
        color:
            isDark ? AppColors.textVaraiantDarkTheme : AppColors.textDarkTheme,
        fontWeight: FontWeight.w300,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .025,
      ),
      headlineLarge: TextStyle(
        color: isDark ? AppColors.textDarkTheme : AppColors.textDarkTheme,
        fontWeight: FontWeight.bold,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .04,
      ),
      headlineMedium: TextStyle(
        color: isDark ? AppColors.textVaraiantDarkTheme : Colors.white24,
        fontWeight: FontWeight.w500,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .035,
      ),
      headlineSmall: TextStyle(
        color:
            isDark ? AppColors.textVaraiantDarkTheme : AppColors.textDarkTheme,
        fontWeight: FontWeight.w300,
        fontFamily: AppFontsUrl.primaryFonts,
        fontSize: size.width * .03,
      ),
    );
  }
}
