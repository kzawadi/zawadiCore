import 'package:designsys/designsys.dart';

String kFontFamily = 'Inter';

double kLineHeight = 1.25;

double kLineHeightTwo = 1.5;

bool isDarkMode(BuildContext context) {
  if (Theme.of(context).colorScheme == ZawadiDarkColors.colorScheme) {
    return true;
  } else {
    return false;
  }
}

Color? lightDarkModeDefaultTextColor(ThemeData themeData) {
  if (themeData.brightness == Brightness.dark) {
    return ZawadiColors.gray[100];
  } else {
    return ZawadiColors.gray;
  }
}
