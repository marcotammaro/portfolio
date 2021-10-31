import 'package:flutter/material.dart';

/// A Widget to manage the responsiviness of the UI, it provides methods to look at the
/// window width at establish if the windows is mobile or tablet sized.
///
/// The mobile / tablet theshold is 900 (size >= 900 is tablet; size < 900 is mobile)
class Responsive extends StatelessWidget {
  static const double mobileTabletTheshold = 900;
  final Widget mobile;
  final Widget tablet;

  const Responsive({
    Key? key,
    required this.mobile,
    required this.tablet,
  }) : super(key: key);

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
