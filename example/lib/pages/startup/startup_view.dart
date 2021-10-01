import 'package:designsys/designsys.dart';
import 'package:zawadi_design/pages/startup/views/startup_view_landscape.dart';
import 'package:zawadi_design/pages/startup/views/startup_view_portrait.dart';
import 'package:zawadi_design/pages/startup/views/startup_view_tablet.dart';

///The startup view when an app is loaded from dead state
///this will have three different views representing three different screen types
class StartUpView extends StatelessWidget {
  const StartUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: StartUpMobilePortrait(),
        landscape: StartUpViewLandscape(),
      ),
      tablet: StartUpViewTablet(),
    );
  }
}
