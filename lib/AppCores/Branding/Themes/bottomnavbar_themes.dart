import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class AppBottomNavBarThemes {
  AppBottomNavBarThemes._();

  static BottomNavigationBarThemeData darkBg(
      BuildContext context, bool isDark) {
    return BottomNavigationBarThemeData(
      selectedLabelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: AppColors.links),
      unselectedLabelStyle: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: AppColors.links),
      type: BottomNavigationBarType.fixed,
      selectedIconTheme: IconThemeData(
        color: AppColors.links,
      ),
      unselectedIconTheme: IconThemeData(
        color: AppColors.iconsVaraintDarkTheme,
      ),
      selectedItemColor: AppColors.links,
      unselectedItemColor: AppColors.textVaraiantDarkTheme,
      backgroundColor: Colors.white,
    );
  }
}
