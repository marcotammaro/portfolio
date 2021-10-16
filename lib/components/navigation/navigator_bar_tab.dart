import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive.dart';
import 'package:portfolio/palette.dart';

class NavigationBarTab extends StatefulWidget {
  const NavigationBarTab(
      {Key? key,
      required this.title,
      this.onTap,
      this.hovering,
      required this.heigth})
      : super(key: key);

  final String title;
  final VoidCallback? onTap;
  final Function(bool)? hovering;
  final double heigth;

  @override
  _NavigationBarTabState createState() => _NavigationBarTabState();
}

class _NavigationBarTabState extends State<NavigationBarTab> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.heigth,
      child: Padding(
        padding: EdgeInsets.only(
          right: Responsive.isMobile(context) ? 0 : 20,
          top: 10,
          bottom: 10,
        ),
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
              padding: const EdgeInsets.all(2),
              color: Palette.secondaryColor,
              child: Container(
                color: _isHovering
                    ? Palette.secondaryColor
                    : Palette.backgroundColor,
                padding: const EdgeInsets.all(10),
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
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
    );
  }
}
