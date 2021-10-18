import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';
import 'package:portfolio/views/_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  late bool _showGoToTopButton;
  late ScrollController _scrollController;
  late Map<String, Widget> tabs;

  @override
  void initState() {
    super.initState();

    // Index of the selected route
    _currentIndex = 0;

    // utility variable to manage the go to top button
    _showGoToTopButton = false;

    // homepage routes
    tabs = {
      "/home/marco/about": About(),
      "/home/marco/projects": Projects(),
      "/home/marco/contacts": Contacts(),
    };

    // scroll controller to manage the go to top button
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() => (_scrollController.offset >= 400)
            ? _showGoToTopButton = true
            : _showGoToTopButton = false);
      });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function triggered when the user presses the go to top button
  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(milliseconds: 200),
      curve: Curves.linear,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      floatingActionButton:
          _showGoToTopButton == false ? null : scrollToTopButton(),
      body: Center(
        child: Container(
          width: Responsive.mobileTabletTheshold,
          padding: const EdgeInsets.all(20.0),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  NavigationBar(
                    initialIndex: 0,
                    pages: tabs.keys.toList(),
                    onIndexChange: (index) {
                      setState(() => _currentIndex = index);
                    },
                  ),
                  const SizedBox(height: 40),
                  tabs[tabs.keys.elementAt(_currentIndex)]!,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget scrollToTopButton() {
    double size = 40;

    return SizedBox(
      width: size,
      height: size,
      child: FittedBox(
        child: FloatingActionButton(
          backgroundColor: Palette.mainColor,
          hoverColor: Palette.mainColor,
          focusColor: Palette.mainColor,
          splashColor: Palette.tertiaryColor,
          onPressed: _scrollToTop,
          child: Icon(FontAwesomeIcons.caretUp),
        ),
      ),
    );
  }
}
