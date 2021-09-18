import 'package:designsys/designsys.dart';

class UiElements extends StatelessWidget {
  const UiElements({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: ElementsMobilePortrait(),
        landscape: const _ElementsMobileLandscape(),
      ),
      tablet: const _ElementsTablet(),
    );
  }
}

class ElementsMobilePortrait extends StatelessWidget {
  const ElementsMobilePortrait({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      appBar: AppBar(
        title: Text("UI PREVIEWS"),
        centerTitle: true,
        elevation: 0.0,
        titleSpacing: 2.0,
      ),
      // resizeToAvoidBottomInset: true,
    );
  }
}

class _ElementsMobileLandscape extends StatelessWidget {
  const _ElementsMobileLandscape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ZawadiScaffold(
      appBar: AppBar(
        title: Text("UI PREVIEWS"),
        centerTitle: true,
        elevation: 0.0,
        titleSpacing: 2.0,
      ),
      // resizeToAvoidBottomInset: true,
    );
  }
}

class _ElementsTablet extends StatelessWidget {
  const _ElementsTablet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
