import 'package:flutter/material.dart';

class ScreenSizeUtil {
  ScreenSizeUtil._();

  static Size getScreenSized(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  static double getAvaiableHeight(BuildContext context,
      {bool? removeAppBarSize,
      bool? removeBottomBarSized,
      bool? removePaddingTop,
      bool? removePaddingBottom}) {
    bool removeAppBarSizeLocal = removeAppBarSize ?? false;
    bool removeBottomBarSizedLocal = removeBottomBarSized ?? false;
    bool removePaddingTopLocal = removePaddingTop ?? false;
    bool removePaddingBottomLocal = removePaddingBottom ?? false;

    final double appBarSizeLocal =
        removeAppBarSizeLocal ? AppBar().preferredSize.height : 0;
    final double bottomBarSizedLocal =
        removeBottomBarSizedLocal ? AppBar().preferredSize.height : 0;
    final double paddingTopLocal =
        removePaddingTopLocal ? MediaQuery.of(context).padding.top : 0;
    final paddingBottomLocal =
        removePaddingBottomLocal ? MediaQuery.of(context).padding.bottom : 0;

    return MediaQuery.of(context).size.height -
        appBarSizeLocal -
        bottomBarSizedLocal -
        paddingTopLocal -
        paddingBottomLocal;
  }

  static double mobile = 600;
  static double tablet = 840;
  static double desktop = 1020;
}
