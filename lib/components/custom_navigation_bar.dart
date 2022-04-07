import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// A custom NavigationBar to manage the pages navigation;
/// once initialized it will display the ```initialIndex``` page that should be within 0 and ```pages.length-1```
/// where ```pages``` is an array with the titles of the NavigationBar Boxes.
class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({
    Key? key,
    required this.initialIndex,
    required this.pages,
    this.onIndexChange,
  }) : super(key: key);

  final Function(int)? onIndexChange;
  final List<String> pages;
  final int initialIndex;

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  /// Constant values
  final double _tabHeigth = 50.0;

  /// Dynamic values
  late String _title;
  late String _currentTabTitle;
  late bool _showTabsOnMobile;
  late bool _blinkingUnderscore;
  late Timer _blinkingUnderscoreTimer;

  @override
  void initState() {
    super.initState();

    if (widget.initialIndex < 0 || widget.initialIndex >= widget.pages.length) {
      throw Exception('NavigationBar initialIndex not in pages range');
    }

    // Initializing values
    this._title = getTitle(widget.pages[widget.initialIndex]);
    this._currentTabTitle = this._title;
    this._showTabsOnMobile = false;
    this._blinkingUnderscore = false;

    // Periodic timer tomake the underscore blinking animation
    _blinkingUnderscoreTimer = Timer.periodic(
      const Duration(milliseconds: 500),
      (timer) {
        setState(() {
          _blinkingUnderscore = !_blinkingUnderscore;
        });
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: titleBox),
            Responsive.isMobile(context)
                ? mobileButton
                : const SizedBox.shrink(),
          ],
        ),
        (Responsive.isTablet(context) || _showTabsOnMobile)
            ? const SizedBox(height: 20)
            : const SizedBox.shrink(),
        Responsive.isTablet(context)
            ? Wrap(
                direction: Axis.horizontal,
                children: tabs,
              )
            : _showTabsOnMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: tabs + [const SizedBox(width: double.infinity)],
                  )
                : const SizedBox.shrink(),
      ],
    );
  }

  /// Utility function to set the correct title format
  String getTitle(String text) {
    return text + " >";
  }

  /// The box that containe the current nav page
  Widget get titleBox {
    return Container(
      height: _tabHeigth,
      color: Palette.mainColor,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            _blinkingUnderscore ? _title + "_" : _title + " ",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Palette.backgroundColor,
            ),
          ),
        ),
      ),
    );
  }

  /// The available tabs under the title
  List<Widget> get tabs {
    return List.generate(
      widget.pages.length,
      (index) {
        String title = widget.pages[index];
        return BorderedButton(
          title: title,
          heigth: _tabHeigth,
          onTap: () {
            setState(() {
              this._showTabsOnMobile = false;
              this._title = getTitle(title);
              this._currentTabTitle = getTitle(title);
            });
            if (widget.onIndexChange != null) widget.onIndexChange!(index);
          },
          hovering: (isHovering) {
            setState(() => this._title = isHovering
                ? _currentTabTitle + " cd " + widget.pages[index]
                : _currentTabTitle);
          },
        );
      },
    );
  }

  /// Define the three bars in the upper right corner of
  /// mobile device used to show the tabBoxes
  Widget get mobileButton {
    return Container(
      height: 50,
      color: Palette.mainColor,
      child: Align(
        alignment: Alignment.centerRight,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 10.0, // the actual right padding is 20.0 (look at children)
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () =>
                  setState(() => _showTabsOnMobile = !_showTabsOnMobile),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Icon(
                  FontAwesomeIcons.bars,
                  size: 18,
                  color: Palette.backgroundColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
