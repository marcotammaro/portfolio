import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextWithLinkAndIcon extends StatelessWidget {
  const CustomTextWithLinkAndIcon(
      {Key? key, required this.link, required this.icon, this.text})
      : super(key: key);

  final String link;
  final String? text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            color: Palette.secondaryColor,
            size: 28,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => launch(link),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                text ?? link,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
