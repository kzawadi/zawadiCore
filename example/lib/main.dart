import 'package:designsys/designsys.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/app/app.router.dart';

// An example of different Zawadi custom design system and architecture
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();
  runApp(
    DevicePreview(
      enabled: true, //todo remember to switch this back to [!releaseMode]
      builder: (context) => MyApp(),
    ),
  );
}

//The main entry where we load ZawadiCore from Zawadi Design system and hence use
//its functions
// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZawadiApp(
      title: "Zawadi News",
      primaryLightColor: Colors.teal,
      primaryDarkColor: Colors.teal,
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder, // Add the builder here

      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
