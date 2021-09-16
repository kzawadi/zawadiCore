import 'package:designsys/designsys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// An example of different Zawadi custom design system
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Lock screen orientation to vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ZawadiApp(
      title: "Zawadi Design System",
      primaryLightColor: ZawadiColors.green,
      primaryDarkColor: ZawadiDarkColors.green,
      home: ZawadiExample(),
    );
  }
}

class ZawadiExample extends StatelessWidget {
  const ZawadiExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      // appBar: AppBar(
      //   title: Text("Zawadi design system"),
      // ),
      body: Container(),
    );
  }
}
