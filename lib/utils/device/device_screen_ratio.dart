import 'package:flutter/cupertino.dart';

import 'device_utility.dart';

/// -- Class for responsive design
class CustomScreen {
  static bool isMobileSmall(BuildContext context) {
    return TDeviceUtils.getScreenWidth(context) <= 400;
  }

  static bool isMobileMedium(BuildContext context) {
    return TDeviceUtils.getScreenWidth(context) <= 420 &&
        TDeviceUtils.getScreenWidth(context) >= 400;
  }

  static bool isMobileLarge(BuildContext context) {
    return TDeviceUtils.getScreenWidth(context) >= 420;
  }
}
