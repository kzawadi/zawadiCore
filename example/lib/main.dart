import 'package:designsys/designsys.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'widgets/app_drawer.dart';

// An example of different Zawadi custom design system
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Lock screen orientation to vertical
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => ProviderScope(
        child: MyApp(),
      ),
    ));
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
      builder: DevicePreview.appBuilder, // Add the builder here

      home: HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeMobilePortrait(),
        landscape: const _HomeMobileLandscape(),
      ),
      tablet: const _HomeTablet(),
    );
  }
}

class HomeMobilePortrait extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      appBar: AppBar(
        title: Text("Zawadi design system Portrait"),
      ),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class AppDrawer extends StatelessWidget {
//   const AppDrawer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var orientation = MediaQuery.of(context).orientation;
//     return Container(
//       width: orientation == Orientation.portrait ? 250 : 100,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         boxShadow: [
//           BoxShadow(
//             blurRadius: 16,
//             color: Colors.black12,
//           )
//         ],
//       ),
//     );
//   }
// }

class _HomeMobileLandscape extends StatelessWidget {
  const _HomeMobileLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      appBar: AppBar(
        title: Text("Zawadi design system Landscape"),
      ),
      body: Row(
        children: <Widget>[AppDrawer()],
      ),
    );
  }
}

class _HomeTablet extends StatelessWidget {
  const _HomeTablet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var children = [
      Expanded(
        child: Container(),
      ),
      AppDrawer()
    ];
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: orientation == Orientation.portrait
          ? Column(
              children: children,
            )
          : Row(
              children: children.reversed.toList(),
            ),
    );
  }
}
