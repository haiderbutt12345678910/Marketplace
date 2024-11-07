import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class InputDecorationsThemesData {
  InputDecorationsThemesData._();

  static InputDecorationTheme inputDecorationTheme(
      BuildContext context, Size size, bool isDark) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white.withOpacity(.8),
      hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.normal),
      prefixIconColor: AppColors.iconsVaraintDarkTheme,
      suffixIconColor: AppColors.iconsVaraintDarkTheme,
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.bordersDarkTheme, width: 1.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.bordersDarkTheme,
            width: 1.0), // Subdued secondary color
      ),
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: AppColors.bordersDarkTheme,
            width: 1.0), // Light gray for disabled
      ),
      errorStyle: Theme.of(context)
          .textTheme
          .bodySmall!
          .copyWith(color: AppColors.error),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.error, width: 1.0),
      ),
    );
  }
}
