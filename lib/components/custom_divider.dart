import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';

/// A custom Divider implementation with mainColor and thickness of 2 and
/// a top and bottom margin of 40
class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 40),
      child: Divider(
        color: Palette.mainColor,
        thickness: 2,
      ),
    );
  }
}
