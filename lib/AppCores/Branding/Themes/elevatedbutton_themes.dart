import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';

class ElevatedButtonsThemesData {
  ElevatedButtonsThemesData._();

  static Size largeBtnSize(BuildContext context) {
    return Size(ScreenSizeUtil.getScreenSized(context).width,
        ScreenSizeUtil.getScreenSized(context).height * .05);
  }

  static Size smallBtnSize(BuildContext context) {
    return Size(ScreenSizeUtil.getScreenSized(context).height * .1,
        ScreenSizeUtil.getScreenSized(context).height * .05);
  }

  static ButtonStyle darkBg(BuildContext context, Color? bgcolor) {
    return ButtonStyle(
      padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
      backgroundColor: WidgetStateProperty.all(bgcolor ?? AppColors.links),
      foregroundColor: WidgetStateProperty.all(Colors.white),
      textStyle: WidgetStateProperty.all(Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold)),
      shape: WidgetStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0), // Stadium border shape
          side: BorderSide(color: AppColors.bordersDarkTheme), // Black border
        ),
      ),
    );
  }

  static ButtonStyle whiteBg(BuildContext context) {
    return ButtonStyle(
        padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
        backgroundColor:
            WidgetStateProperty.all(AppColors.elevatedButtonWhiteDarkTheme),
        foregroundColor:
            WidgetStateProperty.all(AppColors.elevatedButtonWhiteTextDarkTheme),
        textStyle: WidgetStateProperty.all(Theme.of(context)
            .textTheme
            .titleMedium!
            .copyWith(fontWeight: FontWeight.bold)),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // Stadium border shape
            side: BorderSide(
                color: AppColors.elevatedButtonWhiteDarkTheme), // Black border
          ),
        ));
  }
}
