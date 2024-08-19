import 'package:flutter/cupertino.dart';

import 'device_utility.dart';

/// -- Class for responsive design
class CustomScreen {
  static bool isMobileSmallWidth(BuildContext context) {
    return TDeviceUtils.getScreenWidth(context) <= 400;
  }

  static bool isMobileMediumWidth(BuildContext context) {
    return TDeviceUtils.getScreenWidth(context) <= 420 &&
        TDeviceUtils.getScreenWidth(context) > 400;
  }

  static bool isMobileLargeWidth(BuildContext context) {
    return TDeviceUtils.getScreenWidth(context) > 420;
  }

  static bool isMobileSmallHeight() {
    return TDeviceUtils.getScreenHeight() <= 820;
  }

  static bool isMobileMediumHeight() {
    return TDeviceUtils.getScreenHeight() <= 860 &&
        TDeviceUtils.getScreenHeight() > 850;
  }

  static bool isMobileLargeHeight() {
    return TDeviceUtils.getScreenHeight() <= 870 &&
        TDeviceUtils.getScreenHeight() > 860;
  }

  static bool isMobileExtraLargeHeight() {
    return TDeviceUtils.getScreenHeight() > 870 &&
        TDeviceUtils.getScreenHeight() <= 1000;
  }
}
