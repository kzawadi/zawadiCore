import 'package:designsys/enums/device_screen_type.dart';
import 'package:designsys/responsive/responsive_builder.dart';
import 'package:flutter/widgets.dart';

/// This is  a widget Builder which build three device screen sizes
/// namely
/// * 1. mobile
/// * 2. tablet
/// * 3. desktop
/// and if nothing is given tonits parameters it will default to mobile (Null-Safety)
class ScreenTypeLayout extends StatelessWidget {
  // Mobile will be returned by default
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout(
      {Key? key, required this.mobile, this.tablet, this.desktop})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      // If sizing indicates Tablet and we have a tablet widget then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.Tablet) {
        if (tablet != null) {
          return tablet!;
        }
      }

      // If sizing indicates desktop and we have a desktop widget then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.Desktop) {
        if (desktop != null) {
          return desktop!;
        }
      }

      // Return mobile layout if nothing else is supplied
      return mobile;
    });
  }
}
