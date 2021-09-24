import 'package:designsys/designsys.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:zawadi_design/app/app.locator.dart';
import 'package:zawadi_design/app/app.router.dart';
import 'package:zawadi_design/ui/elements.dart';
import 'package:zawadi_design/widgets/app_drawer.dart';

// import 'ui/elements.dart';
// import 'widgets/app_drawer.dart';

// An example of different Zawadi custom design system
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  /// Lock screen orientation to vertical
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
  //   (_) {
  runApp(
    DevicePreview(
      enabled: true, //todo remember to switch this back to [!releaseMode]
      builder: (context) =>
          // ProviderScope(
          // child:
          MyApp(),
      // ),
    ),
  );
  //   },
  // );
}

//The main entry where we load ZawadiCore from Zawadi Design system and hence use
//its functions
// This widget is the root of your application.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZawadiApp(
      title: "",
      primaryLightColor: ZawadiColors.green,
      primaryDarkColor: ZawadiDarkColors.green,
      builder: DevicePreview.appBuilder, // Add the builder here
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}

//From here we are trying to understand the underlying device we are running so
//to run the widget of that device category
//This is to make sure the app layout is good in mobile,web,desktop and foldables
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

//The Mobile potrait home page
//This page will only load when a device is a mobile with its mediaQuary property
//of width being less than [<600]
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

//The Mobile landscape home page
//This page will only load when a device is a mobile with its mediaQuary property
//of width being less than [<600]
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

//The Tablet home page
//This page will only load when a device is a Tablet with its mediaQuary property
//of width being greater than [>600]. But here is a simple catch while a fodable is
//both mobile and tablet the design system intelligently responds to actual sizing information
//so if the foldable is full opened it will be a tablet and closed it will be a mobile
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
