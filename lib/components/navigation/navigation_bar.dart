import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/components/navigation/navigator_bar_tab.dart';
import 'package:portfolio/components/responsive.dart';
import 'package:portfolio/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationBar extends StatefulWidget {
  const NavigationBar({
    Key? key,
    required this.initialIndex,
    this.onIndexChange,
    required this.pages,
  }) : super(key: key);

  final Function(int)? onIndexChange;
  final int initialIndex;
  final List<String> pages;

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  /// Constant values
  final double _tabHeigth = 75.0;

  /// Dynamic values
  late String _title;
  late String _currentTabTitle;
  late bool _showTabsOnMobile;
  late bool _blinkingUnderscore;
  late Timer _blinkingUnderscoreTimer;

  @override
  void initState() {
    super.initState();

    // Initializing values
    this._title = "> cd " + widget.pages[widget.initialIndex];
    this._currentTabTitle = this._title;
    this._showTabsOnMobile = false;
    this._blinkingUnderscore = false;

    // Periodic timer tomake the underscore blinking animation
    _blinkingUnderscoreTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        setState(() => _blinkingUnderscore = !_blinkingUnderscore);
      },
    );
  }

  @override
  void dispose() {
    _blinkingUnderscoreTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.mobileTabletTheshold,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              titleBox(),
              Responsive.isMobile(context)
                  ? mobileButton()
                  : const SizedBox.shrink()
            ],
          ),
          (Responsive.isTablet(context) || _showTabsOnMobile)
              ? const SizedBox(height: 20)
              : const SizedBox.shrink(),
          (Responsive.isTablet(context) || _showTabsOnMobile)
              ? Container(
                  height: Responsive.isMobile(context)
                      ? (_tabHeigth * widget.pages.length).toDouble()
                      : _tabHeigth,
                  child: ListView.builder(
                      scrollDirection: Responsive.isMobile(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      itemCount: widget.pages.length,
                      itemBuilder: (context, index) {
                        String title = widget.pages[index];
                        return NavigationBarTab(
                          title: title,
                          heigth: _tabHeigth,
                          onTap: () {
                            setState(() {
                              this._title = "> cd " + title;
                              this._currentTabTitle = "> cd " + title;
                            });
                            if (widget.onIndexChange != null)
                              widget.onIndexChange!(index);
                          },
                          hovering: (isHovering) {
                            setState(() => this._title = isHovering
                                ? "> cd " + widget.pages[index]
                                : _currentTabTitle);
                          },
                        );
                      }),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  /// The box that containe the current nav page
  Widget titleBox() {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Palette.mainColor,
      child: Text(
        _blinkingUnderscore ? _title + "_" : _title + " ",
        style: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: Palette.backgroundColor,
        ),
      ),
    );
  }

  /// Define the three bars in the upper right corner of
  /// mobile device used to show the tabBoxes
  Widget mobileButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => _showTabsOnMobile = !_showTabsOnMobile),
        child: Icon(
          FontAwesomeIcons.bars,
          color: Palette.mainColor,
        ),
      ),
    );
  }
}
