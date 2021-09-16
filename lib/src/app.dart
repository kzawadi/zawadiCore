// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:designsys/designsys.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// The Main Entry to utilize the unified design system
class ZawadiApp extends StatelessWidget {
  final String? title;
  final Widget? home;
  final Color? primaryLightColor;
  final Color? primaryDarkColor;
  final Color primaryLightVariantColor;
  final Color primaryDarkVariantColor;
  final List<NavigatorObserver>? navigatorObservers;

  const ZawadiApp({
    required this.title,
    required this.home,
    required this.primaryLightColor,
    required this.primaryDarkColor,
    this.primaryLightVariantColor = ZawadiColors.blue,
    this.primaryDarkVariantColor = ZawadiDarkColors.blue,
    this.navigatorObservers,
  });
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, watch, child) {
        final repo = watch(themeProvider);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title!,
          themeMode: repo.themeMode,
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
          home: home,
        );
      },
    );
  }
}
