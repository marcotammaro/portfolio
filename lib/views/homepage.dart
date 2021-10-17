import 'package:flutter/material.dart';
import 'package:portfolio/components/_components.dart';

import 'about.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> tabTitles = [
    "/home/marco/about",
    "/home/marco/projects",
    "/home/marco/contacts",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Container(
          width: Responsive.mobileTabletTheshold,
          padding: const EdgeInsets.all(20.0),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
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
                  About(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
