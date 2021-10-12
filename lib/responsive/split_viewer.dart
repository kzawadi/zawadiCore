// split_view.dart
<<<<<<< HEAD
import 'package:designsys/designsys.dart';
=======
>>>>>>> 35ababcc045023b18f44450ad790113d2c352904
import 'package:designsys/responsive/responsive.dart';
import 'package:flutter/material.dart';

class SplitViewer extends StatelessWidget {
  const SplitViewer({
    Key? key,
    // menu and content are now configurable
    required this.menu,
    required this.content,
    // these values are now configurable with sensible default values
    // this.breakpoint = 600,
    this.menuWidth = 240,
  }) : super(key: key);
  final Widget menu;
  final Widget content;
  // final double breakpoint;
  final double menuWidth;

  @override
  Widget build(BuildContext context) {
    // final screenWidth = MediaQuery.of(context).size.width;
    if (Responsive.isTablet(context)) {
      // widescreen: menu on the left, content on the right
      return Row(
        children: [
          SizedBox(
            width: menuWidth,
            child: menu,
          ),
          Container(width: 0.5, color: Colors.black),
          Expanded(child: content),
        ],
      );
    } else {
      // narrow screen: show content, menu inside drawer
<<<<<<< HEAD
      return ZawadiScaffold(
=======
      return Scaffold(
>>>>>>> 35ababcc045023b18f44450ad790113d2c352904
        body: content,
        drawer: SizedBox(
          width: menuWidth,
          child: Drawer(
            child: menu,
          ),
        ),
      );
    }
  }
}
