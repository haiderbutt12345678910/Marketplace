import 'package:flutter/material.dart';

class TagsWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Size size;
  final bool? fillColor;

  const TagsWidget({
    super.key,
    required this.text,
    required this.color,
    required this.size,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      alignment: Alignment.center,
      margin: fillColor == null
          ? EdgeInsets.only(
              
              right: size.height * .005, top: size.height * .005,bottom: size.height*.005)
          : null,
      padding: EdgeInsets.symmetric(
          horizontal: size.height * .0003, vertical: size.height * .004),
      decoration: BoxDecoration(
        borderRadius:  BorderRadius.circular(2),
        color: fillColor == null ? null : color,
        border: Border.all(
          color: color, // Change the color here
          width: 1, // Adjust the border width if needed
        ),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(color: fillColor == null ? color : Colors.white,fontWeight: FontWeight.bold),
      ),
    );
  }
}
