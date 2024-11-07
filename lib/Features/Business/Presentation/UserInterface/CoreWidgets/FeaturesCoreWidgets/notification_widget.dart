import 'package:flutter/material.dart';
import 'package:flutter_application_ebay_ecom/AppCores/Branding/appcolors.dart';

class NotificationBadgeWidget extends StatefulWidget {
  final String notificationId;
  final String count;
  const NotificationBadgeWidget(
      {super.key, required this.notificationId, required this.count});

  @override
  State<NotificationBadgeWidget> createState() =>
      _NotificationBadgeWidgetState();
}

class _NotificationBadgeWidgetState extends State<NotificationBadgeWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _notificationWidegt(context);
  }

  Widget _notificationWidegt(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: size.height * .008, vertical: size.height * .008),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: AppColors.notifcationColor),
      child: Text(
        widget.count,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: AppColors.notificationText,fontWeight: FontWeight.bold),
      ),
    );
  }
}
