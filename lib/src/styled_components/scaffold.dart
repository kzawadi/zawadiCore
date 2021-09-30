import 'package:designsys/designsys.dart';

///Just like a stock scaffold from flutter but this is modified for
///consistency with zawadi custom design system
///just some padding and when tap it defocuses all the text fields within
class ZawadiScaffold extends StatelessWidget {
  final Widget? body;
  final Widget? bottomNavBar;
  final AppBar? appBar;
  final EdgeInsets? padding;
  final bool? resizeToAvoidBottomInset;
  final Widget? drawer;
  final Color? backgroundColor;

  const ZawadiScaffold({
    Key? key,
    this.body,
    this.bottomNavBar,
    this.appBar,
    this.padding = const EdgeInsets.only(left: 14, right: 14),
    this.resizeToAvoidBottomInset,
    this.drawer,
    this.backgroundColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => ZawadiMethods.defocusTextfield(context),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset ?? false,
        appBar: appBar,
        bottomNavigationBar: bottomNavBar,
        drawer: drawer,
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: Padding(
            padding: padding ?? const EdgeInsets.only(left: 17, right: 17),
            child: body,
          ),
        ),
      ),
    );
  }
}
