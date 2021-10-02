// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The Main Entry to utilize the unified design system
class ZawadiApp extends StatelessWidget {
  final String? title;
  final Widget? home;
  final Color? primaryLightColor;
  final Color? primaryDarkColor;
  final Color primaryLightVariantColor;
  final Color primaryDarkVariantColor;
  final Widget Function(BuildContext, Widget?)? builder;
  final List<NavigatorObserver>? navigatorObservers;
  final GlobalKey<NavigatorState>? navigatorKey;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  const ZawadiApp({
    this.title,
    this.home,
    required this.primaryLightColor,
    required this.primaryDarkColor,
    this.primaryLightVariantColor = ZawadiColors.blue,
    this.primaryDarkVariantColor = ZawadiDarkColors.blue,
    this.builder,
    this.navigatorObservers,
    this.navigatorKey,
    this.onGenerateRoute,
  });
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
        // systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
      ),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title!,
        navigatorObservers: navigatorObservers ?? [],
        theme: zawadiLightTheme().copyWith(
          primaryColor: primaryLightColor,
          colorScheme: zawadiLightTheme()
              .colorScheme
              .copyWith(primaryVariant: primaryLightVariantColor),
        ),
        darkTheme: zawadiDarkTheme().copyWith(
          primaryColor: primaryDarkColor,
          colorScheme: zawadiDarkTheme()
              .colorScheme
              .copyWith(primaryVariant: primaryDarkVariantColor),
        ),
        builder: builder,
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        home: home,
      ),
    );
  }
}
