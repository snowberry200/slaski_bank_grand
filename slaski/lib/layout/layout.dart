import 'package:flutter/material.dart';

import '../presentation/homepage/desktop.dart';
import '../presentation/homepage/mobile.dart';
import '../presentation/homepage/tablet.dart';

const desktopScreenSize = 1200;
const tabletScreenSize = 800;
const mobileScreenSize = 300;

class Layout extends StatelessWidget {
  const Layout({
    super.key,
  });

  static bool isMobile(context) =>
      MediaQuery.of(context).size.width < tabletScreenSize;
  static bool isTablet(context) =>
      MediaQuery.of(context).size.width > mobileScreenSize &&
      MediaQuery.of(context).size.width <= tabletScreenSize;
  static bool isDesktop(context) =>
      MediaQuery.of(context).size.width >= desktopScreenSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      if (constraints.maxWidth >= desktopScreenSize) {
        return const DesktopScreen();
      } else if (constraints.maxWidth < desktopScreenSize &&
          constraints.maxWidth >= tabletScreenSize) {
        return const TabletScreen();
      } else {
        return const MobileScreen();
      }
    });
  }
}
