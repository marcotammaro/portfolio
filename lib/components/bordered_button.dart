import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';

class BorderedButton extends StatefulWidget {
  const BorderedButton({
    Key? key,
    required this.title,
    this.onTap,
    this.hovering,
    required this.heigth,
    this.removeMargins = false,
  }) : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final Function(bool)? hovering;
  final double heigth;
  final bool removeMargins;

  @override
  _BorderedButtonState createState() => _BorderedButtonState();
}

class _BorderedButtonState extends State<BorderedButton> {
  static const double _borderWidth = 2;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          widget.removeMargins ? null : EdgeInsets.only(right: 10, bottom: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: widget.heigth,
            child: MouseRegion(
              onEnter: (_) => hovering(true),
              onExit: (_) => hovering(false),
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: widget.onTap,
                onTapDown: (_) => hovering(true),
                onTapUp: (_) => Future.delayed(
                  Duration(milliseconds: 100),
                  () => hovering(false),
                ),
                onTapCancel: () => hovering(false),
                child: Container(
                  padding: const EdgeInsets.all(_borderWidth),
                  color: Palette.secondaryColor,
                  child: Container(
                    color: _isHovering
                        ? Palette.secondaryColor
                        : Palette.backgroundColor,
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        widget.title,
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: _isHovering
                                  ? Palette.backgroundColor
                                  : Palette.secondaryColor,
                            ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void hovering(bool status) {
    if (widget.hovering != null) widget.hovering!(status);
    setState(() => _isHovering = status);
  }
}
