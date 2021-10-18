import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        biography(),
        const SizedBox(height: 20),
        experiences(),
        const SizedBox(height: 20),
        education(),
        const SizedBox(height: 20),
        languages(),
        const SizedBox(height: 20),
        certifications(),
      ],
    );
  }

  Widget biography() {
    final birthday = DateTime(1999, 05, 29);
    final now = DateTime.now();
    final difference = now.difference(birthday).inDays;
    final age = (difference / 365).floor();

    return Column(
      children: [
        CustomText(
          text: "Hi, I'm Marco",
          style: CustomTextStyle.h1,
        ),
        CustomText(
          text:
              "$age years old master's student in computer engineering.\nI'm what you could call a technology sufferer, I like everything that works at the rhythm of 0 and 1 and that can be programmed or built with your own hands.",
        ),
        CustomText(
          text:
              "Very passionate about the world of programming, starting from low-level languages up to high-level languages, I can create projects using the most advanced languages such as Swift, Flutter(Dart), Java and C++.",
        ),
        CustomText(
          text:
              "Able to create efficient algorithm and data structure and to manage databases like Firebase, iCloud and Realm or SQL/NoSQL databases.",
        ),
        CustomText(
          text:
              "I truly love working in group because I'm convinced that teamworking stimulates and improves long work sessions and thanks to shared knowledge everyone can improve himself.",
        ),
      ],
    );
  }

  Widget experiences() {
    return Column(
      children: [
        CustomText(
          text: "Experiences",
          style: CustomTextStyle.h2,
        ),
        CustomTextWithDates(
          title: 'Accenture Cyber Hackademy',
          text: 'Student',
          period: '2021',
        ),
        CustomTextWithDates(
          title: 'Apple Developer Academy',
          text: 'Pier (Intern developer)',
          period: '2019 - 2020',
        ),
        CustomTextWithDates(
          title: 'Apple Developer Academy',
          text: 'Student',
          period: '2018 - 2019',
        ),
      ],
    );
  }

  Widget education() {
    return Column(
      children: [
        CustomText(
          text: "Education",
          style: CustomTextStyle.h2,
        ),
        CustomTextWithDates(
          title: 'Università Degli Studi di Napoli "Federico II"',
          text: 'Computer engineering (master)',
          period: '2021 - On Going',
        ),
        CustomTextWithDates(
          title: 'Università Degli Studi di Napoli "Federico II"',
          text:
              'Computer engineering graduated with 99/110\nThesis title: Adversary emulation techniques for cyersecurity assessment',
          period: '2017 - 2020',
        ),
        CustomTextWithDates(
          title: 'Liceo Scientifico Statale "Piero Calamandrei"',
          text: 'Scientific High School Diploma',
          period: '2012 - 2017',
        ),
      ],
    );
  }

  Widget languages() {
    return Column(
      children: [
        CustomText(
          text: "Languages",
          style: CustomTextStyle.h2,
        ),
        CustomText(
          text: "Italian (native)",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
        CustomText(
          text: "English",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget certifications() {
    return Column(
      children: [
        CustomText(
          text: "Certifications",
          style: CustomTextStyle.h2,
        ),
        CustomText(
          text: "Apple Swift Student Challenge WWDC 2020 winner",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
        CustomText(
          text: "CISCO CCNA1 Certification",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
        CustomText(
          text: "1st prize at HACK.GOV - Ericsson Challenge",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
        CustomText(
          text: "FileMaker Pro Advanced Developer Training",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
        CustomText(
          text: "Google Digital Marketing Training course",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
        CustomText(
          text: "GDPR regulation",
          style: CustomTextStyle.p,
          tab: 1,
          leading: Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Icon(
              FontAwesomeIcons.asterisk,
              size: 10,
              color: Palette.secondaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
