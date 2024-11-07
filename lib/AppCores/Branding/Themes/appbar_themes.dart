import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class AppappBarThemes {
  AppappBarThemes._();

  static AppBarTheme appappBarThemes(
      BuildContext context, Size size, bool isDark) {
    return AppBarTheme(
        backgroundColor: Colors.greenAccent,
        titleTextStyle: Theme.of(context).textTheme.titleLarge,
        iconTheme: IconThemeData(
            color: AppColors.iconsDarkTheme, size: size.height * .025));
  }
}
