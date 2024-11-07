import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ConstStrings/AppStrings/authentication_strings.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/loginscreen.dart';
import 'package:flutter_application_ebay_ecom/Features/Authentication/Presentation/UserInterface/registerscreen.dart';

class AccountCheckWidegt extends StatelessWidget {
  final bool isLoginPage;
  final Size size;
  const AccountCheckWidegt(
      {super.key, required this.isLoginPage, required this.size});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          isLoginPage
              ? AuthenticationStrings.subTitleDontHaveAnAccountText
              : AuthenticationStrings.subTitleAlreadyHaveAnAccountText,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 16),
        ),
        TextButton(
            onPressed: () {
              if (isLoginPage) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegisterScreen()),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogInScreen()),
                );
              }
            },
            child: Text(isLoginPage
                ? "Sign Up Here"
                : "Sign In"))
      ],
    );
  }
}
