import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';
import 'package:flutter_application_ebay_ecom/AppCores/CoreWidgets/pageheadings.dart';
import 'package:flutter_application_ebay_ecom/AppCores/ScreenSizeUtils/screensize.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/businessappbarwidet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var notVals = [
    [false, "Sms notifications",Icons.sms_outlined],
    [false, "Whats app notificaions",FontAwesomeIcons.whatsapp],
    [false, "Email notificaions",Icons.email_outlined],
    [false, "Push notifications",Icons.notifications_outlined]

  ];

  var themeVal = [
    [false, "DarkTheme"],
    [false, "CustomThemes"],
  ];

  @override
  Widget build(BuildContext context) {
    final size = ScreenSizeUtil.getScreenSized(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(double.infinity, size.height*.1),
          child:const BusinessAppBarWidget(),
        ),
      body: SingleChildScrollView(
        child: Column(
          children: [_notifications(context, size)],
        ),
      ),
    );
  }

  Widget _notifications(BuildContext context, Size size) {
    return Column(
      children: [
       
        Padding(
          padding:const EdgeInsets.only(left: 25),
          child: HeadingsWidet(h1: "Notifications", alignment: Alignment.topLeft)),
        for (int i = 0; i < notVals.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * .04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(notVals[i][2] as IconData,color: AppColors.links,size: 25,
                        ),
                     const   SizedBox(width: 10,),
                        Text(notVals[i][1] as String,style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Switch(
                      value: notVals[i][0] as bool,
                      onChanged: (val) {
                        setState(() {
                          notVals[i][0] = val;
                        });
                      },
                      activeColor: AppColors.links, // Color when switch is on
                      inactiveTrackColor: AppColors
                          .bgVariantDarkTheme, // Color when switch is off
                    ),
                  ],
                ),
              )
            ],
          )
      ],
    );
  }

  Widget _themes(BuildContext context, Size size) {
    return Column(
      children: [
        SizedBox(
          height: size.height * .05,
        ),
  Padding(
          padding:const EdgeInsets.only(left: 25),
          child: HeadingsWidet(h1: "Themes", alignment: Alignment.topLeft)),        for (int i = 0; i < themeVal.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: size.height * .01,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: size.height * .04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(themeVal[i][1] as String),
                    Switch(
                      value: themeVal[i][0] as bool,
                      onChanged: (val) {
                        setState(() {
                          themeVal[i][0] = val;
                        });
                      },
                      activeColor: AppColors.links, // Color when switch is on
                      inactiveTrackColor: AppColors
                          .bgVariantDarkTheme, // Color when switch is off
                    ),
                  ],
                ),
              )
            ],
          )
      ],
    );
  }
}
