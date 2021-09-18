import 'package:designsys/designsys.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'ui/elements.dart';
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

class HomeMobilePortrait extends StatefulWidget {
  @override
  _HomeMobilePortraitState createState() => _HomeMobilePortraitState();
}

class _HomeMobilePortraitState extends State<HomeMobilePortrait> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  final List<Widget> _views = [
    ElementsMobilePortrait(),
    UiElements(),
  ];

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      appBar: AppBar(
        title: Text("Zawadi design system Portrait"),
      ),
      key: _scaffoldKey,
      drawer: AppDrawer(),
      body: _views[currentIndex],
      bottomNavBar: BottomNavigationBar(
        // backgroundColor: Theme.of(context).backgroundColor,
        currentIndex: 0,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: IconlyIcon(IconlyBold.Home,
                size: 24,
                color: currentIndex == 0
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.secondaryVariant),
            label: 'page1',
          ),
          BottomNavigationBarItem(
            icon: IconlyIcon(IconlyBold.Chart,
                size: 24,
                color: currentIndex == 1
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).colorScheme.secondaryVariant),
            label: 'page2',
          ),
        ],
      ),
    );
  }
}

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
