import 'package:designsys/designsys.dart';
import 'package:designsys/config/themes/light_theme/light_color_palette.dart';
import 'package:designsys/config/themes/text_themes/mobile_text_theme.dart';
import 'package:flutter/material.dart';

ThemeData zawadiLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: MobileTextTheme.theme(base),
    primaryIconTheme: IconThemeData(size: 24, color: ZawadiColors.iconPrimary),
    // accentIconTheme: IconThemeData(size: 24, color: ZawadiColors.iconPrimary),
    dividerTheme: DividerThemeData(
      space: 0,
      thickness: 0.5,
      color: ZawadiColors.borderPrimary!,
    ),
    iconTheme: IconThemeData(
      color: ZawadiColors.iconPrimary,
      size: 24.0,
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: ZawadiColors.bgPrimary,
      contentTextStyle: TextStyle(
        color: ZawadiColors.textPrimary,
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
      fillColor: ZawadiColors.gray[300],
      hoverColor: ZawadiColors.gray[400],
      enabledBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiColors.transparent,
          width: 1.5,
        ),
      ),
      errorBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiColors.bgDangerInverse!,
          width: 1.5,
        ),
      ),
      focusedBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiColors.transparent,
          width: 1.5,
        ),
      ),
      focusedErrorBorder: SquircleInputBorder(
        radius: BorderRadius.all(Radius.circular(35)),
        side: BorderSide(
          color: ZawadiColors.bgDangerInverse!,
          width: 1.5,
        ),
      ),
      helperStyle: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: ZawadiColors.textPrimary,
        height: 1.5,
      ),
      hintStyle: TextStyle(
        fontSize: 15.0,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w600,
        color: ZawadiColors.textSecondary,
        height: 1.5,
      ),
      labelStyle: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ZawadiColors.textPrimary,
        height: 1.5,
      ),
      prefixStyle: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ZawadiColors.colorScheme.secondaryVariant,
        height: 1.5,
      ),
      suffixStyle: TextStyle(
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: ZawadiColors.colorScheme.secondaryVariant,
        height: 1.5,
      ),
    ),
    cardTheme: CardTheme(
      margin: EdgeInsets.zero,
      shape: SquircleBorder(
        radius: BorderRadius.circular(37),
        side: BorderSide(
          width: 0.5,
          color: ZawadiColors.borderPrimary!,
        ),
      ),
      elevation: 0.0,
      color: ZawadiColors.bgPrimary,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: ZawadiColors.bgPrimary,
      modalBackgroundColor: ZawadiColors.bgPrimary,
      modalElevation: 0.5,
      shape: SquircleBorder(radius: BorderRadius.circular(45)),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: ZawadiColors.blue,
    ),
    appBarTheme: AppBarTheme(
      color: ZawadiColors.transparent,
      foregroundColor: ZawadiColors.transparent,
      // textTheme: MobileTextTheme.theme(base),
      elevation: 0.0,
    ),
    colorScheme: ZawadiColors.colorScheme,
    primaryColor: ZawadiColors.blue,
    errorColor: ZawadiColors.bgDangerInverse,
    canvasColor: ZawadiColors.bgCanvas,
    splashColor: ZawadiColors.transparent,
    highlightColor: ZawadiColors.transparent,
    backgroundColor: ZawadiColors.bgPrimary,
    scaffoldBackgroundColor: ZawadiColors.bgCanvas,
    dividerColor: ZawadiColors.borderPrimary!,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      unselectedItemColor: ZawadiDarkColors.colorScheme.secondaryVariant,
      selectedItemColor: base.primaryColor,
      selectedLabelStyle: MobileTextTheme.theme(base).bodyText2,
      unselectedLabelStyle: MobileTextTheme.theme(base).bodyText2,
      backgroundColor: ZawadiColors.bgPrimary,
      type: BottomNavigationBarType.fixed,
      elevation: 0.0,
      showSelectedLabels: true,
      showUnselectedLabels: true,
    ),
  );
}
