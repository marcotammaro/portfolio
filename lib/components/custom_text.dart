import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/palette.dart';

enum CustomTextStyle { h1, h2, h3, p }

/// A widget to create h1, h2, h3 and p texts with additional bottomPadding
/// of 20 removable by setting ```noBottomPadding=true```
///
/// Is also possible to add a leading asterisk by setting ```asterisk=true```
class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.style,
    this.color,
    this.asterisk = false,
    this.noBottomPadding = false,
  }) : super(key: key);

  final String text;
  final CustomTextStyle? style;
  final Color? color;
  final bool asterisk;
  final bool noBottomPadding;

  @override
  _CustomTextState createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.noBottomPadding ? 0 : 20.0),
      child: Row(
        children: [
          asterisk,
          Expanded(
            child: SelectableText(
              widget.text,
              style: widget.color != null
                  ? toStyle(widget.style ?? CustomTextStyle.p)
                      ?.copyWith(color: widget.color!)
                  : toStyle(widget.style ?? CustomTextStyle.p),
            ),
          ),
        ],
      ),
    );
  }

  /// Function to convert CustomTextStyle to TextStyle
  TextStyle? toStyle(CustomTextStyle style) {
    switch (style) {
      case CustomTextStyle.h1:
        return Theme.of(context).textTheme.headline1;
      case CustomTextStyle.h2:
        return Theme.of(context).textTheme.headline2;
      case CustomTextStyle.h3:
        return Theme.of(context).textTheme.headline3;
      case CustomTextStyle.p:
        return Theme.of(context).textTheme.bodyText1;
    }
  }

  Widget get asterisk => widget.asterisk
      ? Padding(
          padding: const EdgeInsets.only(right: 10.0, left: 20.0),
          child: Icon(
            FontAwesomeIcons.asterisk,
            size: 10,
            color: Palette.secondaryColor,
          ),
        )
      : const SizedBox.shrink();
}
