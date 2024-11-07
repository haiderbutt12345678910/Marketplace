import 'package:flutter/material.dart';

class ProgressCircularIndicatorCustom extends StatelessWidget {
  final Color? bgColor;
  final Color? barColor;
  const ProgressCircularIndicatorCustom(
      {super.key, this.bgColor, this.barColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: bgColor ?? Colors.grey.withOpacity(.3),
      alignment: Alignment.center,
      width: double.infinity,
      height: double.infinity,
      child: CircularProgressIndicator.adaptive(
        backgroundColor: barColor ?? Colors.blue,
        valueColor:
            AlwaysStoppedAnimation<Color>(barColor ?? Colors.blue),
      ),
    );
  }
}
