import 'package:flutter/material.dart';

import '../ConstStrings/AssetsStrings/assetsurl.dart';

class AppBarTtile extends StatelessWidget {
  const AppBarTtile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        height: 70,
        margin: const EdgeInsets.only(left: 20),
        child: Image.asset(
          width: 70,
          height: 60,
          AppAssetsUrl.brandLogo,
        ));
  }
}
