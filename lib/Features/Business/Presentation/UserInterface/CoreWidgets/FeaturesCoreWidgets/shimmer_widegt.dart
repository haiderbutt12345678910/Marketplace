import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidegt extends StatelessWidget {
  final Size size;
  final double shimmerWidth;
  final double shimmerHeight;
  final BorderRadius? borderRadius;
  final bool isfullImage;

  const ShimmerWidegt({
    super.key,
    this.isfullImage = false,
    this.shimmerWidth = 1.0,
    this.shimmerHeight = 1.0,
    this.borderRadius,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1000),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.height * 0.01,
            vertical: size.height * 0.01,
          ),
          width: isfullImage ? size.width : double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: isfullImage
              ? ClipRRect(
                  child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Container(
                    color: Colors.grey,
                    width: double.infinity,
                    height: size.height * .2,
                  ),
                ))
              : Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                      child: Container(
                        color: Colors.grey,
                        width: double.infinity,
                        height: size.height * .2,
                      ),
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.height * .05),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        top: size.height * .01,
                        left: size.height * .01,
                      ),
                      color: Colors.grey,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.height * .05),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        top: size.height * .01,
                        left: size.height * .01,
                      ),
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.height * .05),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        top: size.height * .01,
                        left: size.height * .01,
                      ),
                      color: Colors.grey,
                    ),
                    SizedBox(
                      height: size.height * .01,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.height * .05),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        top: size.height * .01,
                        left: size.height * .01,
                      ),
                      color: Colors.grey,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: size.height * .05),
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.only(
                        top: size.height * .05,
                        left: size.height * .05,
                      ),
                      color: Colors.grey,
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.height * .05,
                            vertical: size.height * .03),
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.only(
                            top: size.height * .05,
                            left: size.height * .05,
                            bottom: size.height * .05),
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
        ));
  }
}
