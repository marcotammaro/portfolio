import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 40),
        Divider(
          color: Palette.mainColor,
          thickness: 2,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
