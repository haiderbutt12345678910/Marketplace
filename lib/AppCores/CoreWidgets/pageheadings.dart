import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

// ignore: must_be_immutable
class HeadingsWidet extends StatelessWidget {
  final bool? hasVarient;
  final String h1;
  final String? h2;
  Color? color;
  bool withRow = false;
  final Alignment alignment;
  IconData? iconData;
  HeadingsWidet(
      {super.key,
      this.hasVarient,
      required this.h1,
      this.h2,
      required this.alignment,
      this.color});
  HeadingsWidet.withH1Icon(
      {super.key,
      this.hasVarient,
      required this.h1,
      this.h2,
      required this.iconData,
      required this.alignment});

  HeadingsWidet.withRow(
      {super.key,
      this.hasVarient,
      required this.h1,
      this.h2,
      required this.alignment,
      this.withRow = true});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return iconData != null
        ? _h1WithIcon(context, size)
        : _h1WithOutIcon(context, size);
  }

  Widget _h1WithIcon(BuildContext context, Size size) {
    return Container(
      margin: alignment != Alignment.center
          ? EdgeInsets.only(left: size.height * .01)
          : null,
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(iconData,
                  size: size.width * .08, color: AppColors.iconsDarkTheme),
              Container(
                alignment: alignment,
                margin: EdgeInsets.symmetric(
                    vertical: size.height * .01, horizontal: size.height * .01),
                child: Text(
                  h1,
                  style: Theme.of(context).textTheme.headlineLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          if (h2 != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * .04),
              width: double.infinity,
              alignment: alignment,
              child: Text(
                h2 as String,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
            ),
        ],
      ),
    );
  }

  Widget _h1WithOutIcon(BuildContext context, Size size) {
    return Container(
      margin: alignment != Alignment.center
          ? EdgeInsets.only(left: size.height * .005)
          : null,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //h1
          Container(
            margin: EdgeInsets.symmetric(vertical: size.height * .01,horizontal: size.height * .004),
            alignment: alignment,
            width: withRow ? null : double.infinity,
            child: Text(
              h1,
              style: color == null
                  ? Theme.of(context).textTheme.headlineLarge
                  : Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: color),
              textAlign: TextAlign.center,
            ),
          ),
          if (h2 != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.height * .004),
              width: double.infinity,
              alignment: alignment,
              child: Text(
                h2 as String,
                style: hasVarient==null? Theme.of(context).textTheme.headlineMedium:
                Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w300,color: Colors.black)
                ,
                textAlign:hasVarient==null? TextAlign.center:TextAlign.left
              ),
            ),
        ],
      ),
    );
  }
}
