import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';
import 'package:portfolio/views/_views.dart';

import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  final List<String> tabTitles = [
    "/home/marco/about",
    "/home/marco/projects",
    "/home/marco/contacts",
  ];

  @override
  void initState() {
    super.initState();

    // scroll controller to manage the go to top button
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() => (_scrollController.offset >= 400)
            ? _showBackToTopButton = true
            : _showBackToTopButton = false);
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
          _showBackToTopButton == false ? null : scrollToTopButton(),
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
                    pages: tabTitles,
                    onIndexChange: (index) {
                      setState(() => _currentIndex = index);
                    },
                  ),
                  const SizedBox(height: 40),
                  body(_currentIndex),
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

  Widget body(int index) {
    switch (index) {
      case 0:
        return About();
      case 1:
        return Projects();
      case 2:
        return Contacts();
      default:
        return const SizedBox.shrink();
    }
  }
}
