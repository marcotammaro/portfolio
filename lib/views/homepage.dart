import 'package:flutter/material.dart';
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
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: Responsive.mobileTabletTheshold,
          padding: const EdgeInsets.all(20.0),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  NavigationBar(
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget get copyright {
    return Text(
      "© 2021 Marco Tammaro",
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
