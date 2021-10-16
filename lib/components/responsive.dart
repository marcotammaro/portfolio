import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

  static const double mobileTabletTheshold = 1000;

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < mobileTabletTheshold;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= mobileTabletTheshold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= mobileTabletTheshold) {
        return tablet;
      } else {
        return mobile;
      }
    });
  }
}
