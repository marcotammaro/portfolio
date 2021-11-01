import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';
import 'package:url_launcher/url_launcher.dart';

/// A widget with a clickable ```text``` that opens a provided ```link``` and a leading list of icons
class CustomTextWithLinkAndIcon extends StatelessWidget {
  const CustomTextWithLinkAndIcon({
    Key? key,
    required this.link,
    this.icons,
    this.text,
  }) : super(key: key);

  final String link;
  final String? text;
  final List<IconData>? icons;

  @override
  Widget build(BuildContext context) {
    List<Widget> iconsWidget = (icons ?? [])
        .map<Widget>((e) => Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Icon(e, color: Palette.secondaryColor, size: 22),
            ))
        .toList();

    return SizedBox(
      child: Row(
        children: iconsWidget +
            [
              Expanded(
                child: GestureDetector(
                  onTap: () => launch(link),
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: Text(
                      text ?? link,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ),
              ),
            ],
      ),
    );
  }
}
