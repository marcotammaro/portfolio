import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';
import 'package:portfolio/views/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'FiraCode',
        backgroundColor: Palette.backgroundColor,
        primaryColor: Palette.mainColor,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Palette.secondaryColor,
            fontSize: 45,
            fontWeight: FontWeight.bold,
            height: 1.5,
          ),
          headline2: TextStyle(
            color: Palette.secondaryColor,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
          headline3: TextStyle(
            color: Palette.secondaryColor,
            fontSize: 18,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
          bodyText1: TextStyle(
            color: Palette.secondaryColor,
            fontSize: 15,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
          headline4: TextStyle(
            color: Palette.tertiaryColor,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            height: 1.5,
          ),
        ),
      ),
      home: HomePage(),
    );
  }
}
