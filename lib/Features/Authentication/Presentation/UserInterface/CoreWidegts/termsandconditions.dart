import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AppStrings/global_strings.dart';

class TermsAndPrivacyWidget extends StatelessWidget {
  const TermsAndPrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodySmall;

    return Expanded(
      child: Container(
        width: double.infinity,
        alignment: Alignment.bottomCenter,
        child: RichText(
          text: TextSpan(
            style: textStyle,
            children: [
              TextSpan(
                text: GlobalStrings.termsAndPrivacyText[0],
              ),
              TextSpan(
                text: GlobalStrings.termsAndPrivacyText[1],
                style: textStyle!.copyWith(
                  color: AppColors.links,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle navigation to Terms of Service screen
                  },
              ),
              TextSpan(
                text: GlobalStrings.termsAndPrivacyText[2],
              ),
              TextSpan(
                text: GlobalStrings.termsAndPrivacyText[3],
                style: textStyle.copyWith(
                  color: AppColors.links,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Handle navigation to Privacy Policy screen
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
