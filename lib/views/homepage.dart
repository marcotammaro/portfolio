import 'package:flutter/material.dart';
import 'package:portfolio/components/navigation/navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<String> tabTitles = [
    "/home/marco/about",
    "/home/marco/link",
    "/home/marco/contacts"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          NavigationBar(
            initialIndex: 0,
            pages: tabTitles,
            onIndexChange: (index) {
              setState(() => _currentIndex = index);
            },
          ),
          Container(),
        ],
      ),
    );
  }
}
