import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class CustomSnackbar {

  static void show({
      int? duration,
    required BuildContext buildContext,
    required String errorheading,
    required String error,
    required Color iconColor,
    required IconData iconData,
    
  }) {
    // Create the snackbar content with an icon and aligned text
    var snackBarContent = ListTile(
      contentPadding:const EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(iconColor==Colors.green?Icons.check_circle_outline:Icons.error, color: iconColor, size: 40),
    title: Text(errorheading,style: Theme.of(buildContext).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold,color:iconColor),),
    subtitle:Text(
      textAlign: TextAlign.start,
      error,style: Theme.of(buildContext).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold)),
    );

    // Create the snackbar
    var snackBar = SnackBar(
      padding:const EdgeInsets.all(1),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.links, width: 1), // Grey border
        borderRadius: BorderRadius.circular(15), // Rounded corners
      ),
      elevation: 10,
      duration:  Duration(seconds:duration ?? 3),
      content: snackBarContent,
      
      backgroundColor: Colors.white, // Transparent to allow custom styling
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(80),
    );

    // Show the snackbar
    ScaffoldMessenger.of(buildContext).showSnackBar(snackBar);
  }
}
