import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/conststrings/AppStrings/authentication_strings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/CoreWidegts/termsandconditions.dart';

import '../../../../AppCores/CoreWidgets/appbartitle.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const AppBarTtile()),
        body: _verifyEmaiLWidget(context, size));
  }

  Widget _verifyEmaiLWidget(BuildContext context, Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: size.height * .3,
        ),
        HeadingsWidet.withH1Icon(
            iconData: Icons.email,
            h1: AuthenticationStrings.titleVerifyEmailText,
            h2: AuthenticationStrings.subTitleVerfiyEmailText,
            alignment: Alignment.center),
        const TermsAndPrivacyWidget()
      ],
    );
  }
}
