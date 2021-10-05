import 'package:designsys/designsys.dart';
import 'package:designsys/config/themes/light_theme/light_color_palette.dart';
import 'package:designsys/config/themes/text_themes/mobile_text_theme.dart';
import 'package:flutter/material.dart';

ThemeData zawadiDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    splashColor: ZawadiDarkColors.transparent,
    highlightColor: Colors.transparent,
    textTheme: MobileTextTheme.theme(base),
    dividerTheme: DividerThemeData(
      space: 0,
      thickness: 0.5,
      color: ZawadiDarkColors.borderPrimary!,
    ),
    iconTheme: IconThemeData(
      color: ZawadiDarkColors.iconPrimary,
      size: 24.0,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ZawadiDarkColors.bgPrimary,
      contentTextStyle: TextStyle(
        color: ZawadiDarkColors.textPrimary,
        fontWeight: FontWeight.w400,
        fontSize: 14.0,
        letterSpacing: 0.0,
        height: 1.5,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      // 23 for height 65, 18 for height 50
      contentPadding: const EdgeInsets.all(15),
      filled: true,
      isCollapsed: true,
      fillColor: Color(0xff050505),
      hoverColor: ZawadiDarkColors.gray[400],
      enabledBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiDarkColors.borderPrimary!,
          width: 1.5,
        ),
      ),
      errorBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiDarkColors.bgDangerInverse,
          width: 1.5,
        ),
      ),
      focusedBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiDarkColors.gray[400]!,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiDarkColors.bgDangerInverse,
          width: 1.5,
        ),
      ),
      helperStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: ZawadiDarkColors.textPrimary,
        height: 1.5,
      ),
      hintStyle: TextStyle(
        fontSize: 15.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
        color: ZawadiDarkColors.textSecondary,
        height: 1.5,
      ),
      labelStyle: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ZawadiDarkColors.textPrimary,
        height: 1.5,
      ),
      prefixStyle: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ZawadiDarkColors.colorScheme.secondaryVariant,
        height: 1.5,
      ),
      suffixStyle: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ZawadiDarkColors.colorScheme.secondaryVariant,
        height: 1.5,
      ),
    ),
    colorScheme: ZawadiDarkColors.colorScheme,
    cardTheme: CardTheme(
      margin: EdgeInsets.zero,
      shape: SquircleBorder(
        radius: BorderRadius.circular(37),
        side: BorderSide(width: 0.5, color: ZawadiDarkColors.borderPrimary!),
      ),
      elevation: 0.0,
      color: ZawadiDarkColors.bgCanvasMobile,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ZawadiDarkColors.bgPrimary,
      modalBackgroundColor: ZawadiDarkColors.bgPrimary,
      modalElevation: 0.5,
      shape: SquircleBorder(radius: BorderRadius.circular(55)),
    ),
    textSelectionTheme:
        const TextSelectionThemeData(cursorColor: ZawadiDarkColors.blue),
    appBarTheme: AppBarTheme(
      color: ZawadiColors.transparent,
      foregroundColor: ZawadiColors.transparent,
      // textTheme: MobileTextTheme.theme(base),
      elevation: 0.0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: ZawadiDarkColors.colorScheme.secondaryVariant,
      selectedItemColor: base.primaryColor,
      selectedLabelStyle: MobileTextTheme.theme(base).bodyText2,
      unselectedLabelStyle: MobileTextTheme.theme(base).bodyText2,
      backgroundColor: ZawadiDarkColors.bgCanvasMobile,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primaryColor: ZawadiDarkColors.blue,
    errorColor: ZawadiDarkColors.bgDangerInverse,
    canvasColor: ZawadiDarkColors.bgCanvasMobile,
    backgroundColor: ZawadiDarkColors.bgPrimary,
    scaffoldBackgroundColor: ZawadiDarkColors.bgCanvasMobile,
    dividerColor: ZawadiDarkColors.borderPrimary!,
  );
}
