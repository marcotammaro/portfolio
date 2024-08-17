import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/views/_views.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late int _currentIndex;
  late Map<String, Widget> tabs;

  @override
  void initState() {
    super.initState();

    // Index of the selected route
    _currentIndex = 0;

    // homepage routes
    tabs = {
      "/home/marco/about": About(),
      "/home/marco/projects": Projects(),
      "/home/marco/contacts": Contacts(),
    };
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        bottom: false,
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                width: Responsive.mobileTabletTheshold,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomNavigationBar(
                      initialIndex: _currentIndex,
                      pages: tabs.keys.toList(),
                      onIndexChange: (index) {
                        setState(() => _currentIndex = index);
                      },
                    ),
                    const SizedBox(height: 40),
                    tabs[tabs.keys.elementAt(_currentIndex)]!,
                    const SizedBox(height: 40),
                    copyright,
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get copyright {
    final now = DateTime.now();
    final year = now.year;

    return Text(
      "© $year Marco Tammaro",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
