import 'package:designsys/enums/device_screen_type.dart';
import 'package:flutter/widgets.dart';

DeviceScreenType getDeviceType(MediaQueryData mediaQuery) {
  double deviceWidth = mediaQuery.size.width;

  if (deviceWidth >= 1200) {
    return DeviceScreenType.Desktop;
  } else if (deviceWidth >= 768) {
    return DeviceScreenType.Tablet;
  }

  return DeviceScreenType.Mobile;
}
