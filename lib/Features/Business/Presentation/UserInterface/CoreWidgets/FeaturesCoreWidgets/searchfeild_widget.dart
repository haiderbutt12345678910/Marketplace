import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';

class SearchFeildWidget extends StatelessWidget {
  final bool isSeacrhPage;
  const SearchFeildWidget({super.key, required this.isSeacrhPage});

  @override
  Widget build(BuildContext context) {
    final Size size = ScreenSizeUtil.getScreenSized(context);
    return Container(
      decoration: BoxDecoration(
          color: AppColors.bgVariantDarkTheme, shape: BoxShape.circle),
      width: double.infinity,
      margin: EdgeInsets.symmetric(
          horizontal: size.height * .03, vertical: size.width * .03),
      child: TextField(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(builder: (context) => NewScreen()),
          // );
        },
        cursorColor: AppColors.cursorColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.bgDarkTheme,
          hintText:
              isSeacrhPage ? 'Search on marketplace' : 'Seacrh From Listing',
          hintStyle: Theme.of(context).textTheme.titleMedium,
          contentPadding: EdgeInsets.symmetric(
              vertical: size.height * .02, horizontal: size.height * .01),
          prefixIcon: IconButton(
            icon: Icon(
              CupertinoIcons.search,
              color: AppColors.iconsDarkTheme,
            ),
            onPressed: () {
              // if (isSeacrhPage) {
              //   Navigator.of(context).pop();
              // }
            },
          ),
          suffixIcon: isSeacrhPage
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(CupertinoIcons.mic,
                          color: AppColors.iconsDarkTheme),
                      onPressed: () {
                        // Microphone icon onPressed action
                      },
                    ),
                    IconButton(
                      icon: Icon(CupertinoIcons.camera_rotate,
                          color: AppColors.iconsDarkTheme),
                      onPressed: () {
                        // Camera icon onPressed action
                      },
                    ),
                  ],
                )
              : null,
        ),
      ),
    );
  }
}
