import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextWithLinkAndIcon extends StatelessWidget {
  const CustomTextWithLinkAndIcon({
    Key? key,
    required this.link,
    required this.icons,
    this.text,
  }) : super(key: key);

  final String link;
  final String? text;
  final List<IconData> icons;

  @override
  Widget build(BuildContext context) {
    List<Widget> iconsWidget = icons
        .map<Widget>((e) => Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(e, color: Palette.secondaryColor, size: 28),
            ))
        .toList();

    return Container(
      child: Row(
        children: iconsWidget +
            [
              const SizedBox(width: 10),
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
