import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: size.height * .03, vertical: size.height * .02),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              thickness: 2,
              color: AppColors.dividerColor,
            ),
          ),
          Text(
            "Or LogIn with",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(fontSize: size.height * .02),
          ),
          Expanded(
            child: Divider(
              thickness: 2,
              color: AppColors.dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
