import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';

class NavigationBarTab extends StatefulWidget {
  const NavigationBarTab({
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
  _NavigationBarTabState createState() => _NavigationBarTabState();
}

class _NavigationBarTabState extends State<NavigationBarTab> {
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
              onEnter: (event) {
                if (widget.hovering != null) widget.hovering!(true);
                setState(() {
                  _isHovering = true;
                });
              },
              onExit: (event) {
                if (widget.hovering != null) widget.hovering!(false);
                setState(() {
                  _isHovering = false;
                });
              },
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: widget.onTap,
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
}
