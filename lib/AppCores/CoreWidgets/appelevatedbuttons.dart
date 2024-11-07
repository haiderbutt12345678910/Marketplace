import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/Themes/elevatedbutton_themes.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final Size? buttonSize;
  final String buttonText;
  final bool isSmallBtn;
  final VoidCallback function;
  final IconData? iconData;
  final Color? bgColor;

  const ElevatedButtonWidget(
      {super.key,
      required this.buttonSize,
      required this.function,
      this.iconData,
      this.isSmallBtn = false,
      required this.buttonText,
      this.bgColor = Colors.blueAccent});

  const ElevatedButtonWidget.withIcon({
    super.key,
    required this.buttonSize,
    required this.function,
    required this.iconData,
    this.isSmallBtn = false,
    required this.buttonText,
    this.bgColor = Colors.blueAccent,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = ScreenSizeUtil.getScreenSized(context);
    return iconData != null
        ? _custombuttonWithIcon(context, size)
        : _custombuttonWithOutIcon(context, size);
  }

  Widget _custombuttonWithIcon(BuildContext context, Size size) {
    return InkWell(
      onTap: function,
      child: Container(
        margin: isSmallBtn
            ? EdgeInsets.symmetric(
                horizontal: size.height * .01, vertical: size.height * .01)
            : EdgeInsets.symmetric(
                horizontal: size.height * .04, vertical: size.height * .03),
        width: buttonSize == null
            ? ElevatedButtonsThemesData.largeBtnSize(context).width
            : buttonSize!.width,
        height: buttonSize == null
            ? ElevatedButtonsThemesData.largeBtnSize(context).height
            : buttonSize!.height,
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.bgVariantDarkTheme,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: bgColor ?? AppColors.bordersDarkTheme)),
        padding: isSmallBtn
            ? EdgeInsets.symmetric(
                horizontal: size.height * .005, vertical: size.height * .01)
            : EdgeInsets.symmetric(
                horizontal: size.height * .06, vertical: size.height * .01),
        child: Row(
          children: [
            Expanded(
                flex: isSmallBtn ? 1 : 2,
                child: Container(
                  alignment: Alignment.centerRight,
                  child: Icon(
                    iconData,
                    size: isSmallBtn ? size.height * .018 : size.height * .025,
                    color: AppColors.iconsDarkTheme,
                  ),
                )),
            SizedBox(
              width: size.height * .02,
            ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    buttonText,
                    style: isSmallBtn
                        ? bgColor == null
                            ? Theme.of(context).textTheme.titleSmall
                            : Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.black)
                        : bgColor == null
                            ? Theme.of(context).textTheme.titleMedium
                            : Theme.of(context).textTheme.titleMedium!.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              width: size.height * .04,
            ),
          ],
        ),
      ),
    );
  }

  Widget _custombuttonWithOutIcon(BuildContext context, Size size) {
    return InkWell(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        margin: isSmallBtn
            ? EdgeInsets.symmetric(
                horizontal: size.height * .008, vertical: size.height * .008)
            : EdgeInsets.symmetric(
                horizontal: size.height * .04, vertical: size.height * .03),
        width: buttonSize == null
            ? ElevatedButtonsThemesData.largeBtnSize(context).width
            : buttonSize!.width,
        height: buttonSize == null
            ? ElevatedButtonsThemesData.largeBtnSize(context).height
            : buttonSize!.height,
        decoration: BoxDecoration(
            color: bgColor ?? AppColors.bgVariantDarkTheme,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: bgColor ?? AppColors.bordersDarkTheme)),
        padding: EdgeInsets.symmetric(
            horizontal: size.height * .02, vertical: size.height * .01),
        child: Text(buttonText,
            style: isSmallBtn
                ? bgColor == null
                    ? Theme.of(context).textTheme.titleSmall
                    : Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: Colors.white,fontWeight: FontWeight.bold)
                : bgColor == null
                    ? Theme.of(context).textTheme.titleMedium
                    : Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
