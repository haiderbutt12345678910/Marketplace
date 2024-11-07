import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/Features/Business/Presentation/UserInterface/CoreWidgets/FeaturesCoreWidgets/cartnotification.dart';

class BusinessAppBarWidget extends StatelessWidget {
  const BusinessAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 0,
          backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      
        actions: const [
          
          
          CartNotificationWidget()],
        centerTitle: true,
      );
  }
}