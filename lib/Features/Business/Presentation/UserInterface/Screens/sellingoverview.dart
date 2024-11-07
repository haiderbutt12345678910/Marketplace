import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/appelevatedbuttons.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';

import 'storesetupform.dart';

class SellingOverView extends StatelessWidget {
  SellingOverView({super.key});
  final listicons = [
    CupertinoIcons.camera,
    CupertinoIcons.tag,
    Icons.local_shipping_outlined
  ];
  final String text =
      "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups";
  final list = [
    ['2', 'Active'],
    ['4', 'Sold'],
    ['1', 'Unsold']
  ];

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      
        resizeToAvoidBottomInset: false,
         appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: size.height * .03,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * .05),
              width: double.infinity,
              child: HeadingsWidet(
                  h1: "Sell your item Today",
                  h2: "You Can Start Listing Products Toady and raech global Audience",
                  alignment: Alignment.center),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * .05),
              width: double.infinity,
              child: ElevatedButtonWidget(
                  buttonSize: null,
                  function: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StoreSetupForm()));
                  },
                  buttonText: "Sell An Item"),
            ),
            SizedBox(
              height: size.height * .02,
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: size.height * .05),
            //   width: double.infinity,
            //   child: HeadingsWidet(
            //       h1: "\$US 30.00",
            //       h2: "90 days total",
            //       alignment: Alignment.center),
            // ),
            // SizedBox(
            //   height: size.height * .04,
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: size.height * .08),
            //   width: double.infinity,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       for (int i = 0; i < 3; i++)
            //         Column(
            //           children: [
            //             Text(
            //               list[i][0],
            //               style: Theme.of(context).textTheme.bodyLarge,
            //             ),
            //             SizedBox(
            //               height: size.height * .01,
            //             ),
            //             Text(
            //               list[i][1],
            //               style: Theme.of(context).textTheme.bodyMedium,
            //             ),
            //           ],
            //         )
            //     ],
            //   ),
            // ),
            SizedBox(
              height: size.height * .04,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * .03),
                child: HeadingsWidet(
                    h1: "How it Works", alignment: Alignment.bottomLeft)),
            for (int i = 0; i < 3; i++)
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: size.height * .03),
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Icon(
                            listicons[i],
                            size: 80,
                            color: AppColors.iconsVaraintDarkTheme,
                          ),
                        ),
                        SizedBox(
                          width: size.height * .02,
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            textAlign: TextAlign.center,
                            text,
                            // Allow wrapping for long titles
                            // Truncate if too long
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontWeight: FontWeight.w300),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ],
        )));
  }
}
