import 'package:flutter/material.dart';
import 'package:hapis/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;
  final Widget? desktopBody;

  const ResponsiveLayout(
      {super.key,
      required this.mobileBody,
      required this.tabletBody,
      this.desktopBody});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < mobileWidth) {
        return mobileBody;
      } else {
        // if (constraints.maxWidth < tabletWidth && constraints.maxWidth >= mobileWidth ) {
        return tabletBody;
      }
      // } else {
      //   return desktopBody!;
      // }
    });
  }
}
