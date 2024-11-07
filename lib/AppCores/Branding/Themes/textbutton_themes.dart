import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class AppTextButtonThemeData {
  AppTextButtonThemeData._();

  static TextButtonThemeData textButtonThemedata(
    BuildContext context,
    Size size,
  ) {
    return TextButtonThemeData(
      style: ButtonStyle(
        textStyle: WidgetStateProperty.all<TextStyle>(Theme.of(context)
            .textTheme
            .titleSmall!.copyWith(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 16)
            ),
        foregroundColor: WidgetStateProperty.all<Color>(AppColors.links),
        overlayColor:
            WidgetStateProperty.all<Color>(AppColors.links.withOpacity(.1)),
        // Add more properties as needed
      ),
    );
  }
}
