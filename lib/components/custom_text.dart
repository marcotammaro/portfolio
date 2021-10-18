import 'package:flutter/material.dart';

enum CustomTextStyle { h1, h2, h3, p }

class CustomText extends StatefulWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.style,
    this.color,
    this.leading,
    this.tab = 0,
    this.noBottomPadding = false,
  }) : super(key: key);

  final String text;
  final CustomTextStyle? style;
  final Color? color;
  final Widget? leading;
  final int tab;
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
          SizedBox(width: widget.tab * 20),
          widget.leading ?? const SizedBox.shrink(),
          Expanded(
            child: Text(
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
}
