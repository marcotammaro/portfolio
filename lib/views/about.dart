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
        biography,
        divider,
        experiences,
        divider,
        education,
        divider,
        certifications,
        divider,
        languages,
      ],
    );
  }

  Widget get biography {
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
          noBottomPadding: true,
          text:
              "I truly love working in group because I'm convinced that teamworking stimulates and improves long work sessions and thanks to shared knowledge everyone can improve himself.",
        ),
      ],
    );
  }

  Widget get experiences {
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
          noBottomPadding: true,
          title: 'Apple Developer Academy',
          text: 'Student',
          period: '2018 - 2019',
        ),
      ],
    );
  }

  Widget get education {
    return Column(
      children: [
        CustomText(
          text: "Education",
          style: CustomTextStyle.h2,
        ),
        CustomTextWithDates(
          title: 'Università degli Studi di Napoli "Federico II"',
          text: 'Computer engineering (master)',
          period: '2021 - On Going',
        ),
        CustomTextWithDates(
          title: 'Università degli Studi di Napoli "Federico II"',
          text:
              'Computer engineering graduated with 99/110\nThesis title: Adversary emulation techniques for cyersecurity assessment',
          period: '2017 - 2020',
        ),
        CustomTextWithDates(
          noBottomPadding: true,
          title: 'Liceo Scientifico Statale "Piero Calamandrei"',
          text: 'Scientific High School Diploma',
          period: '2012 - 2017',
        ),
      ],
    );
  }

  Widget get certifications {
    return Column(
      children: [
        CustomText(
          text: "Certifications",
          style: CustomTextStyle.h2,
        ),
        CustomTextWithDates(
          title: 'Apple Swift Student Challenge WWDC 2020 winner',
          period: '16 Jun 2020',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'GDPR regulation',
          period: '21 May 2020',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'FileMaker Pro Advanced Developer Training',
          period: '13 Sep 2019',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'CISCO CCNA1 Certification',
          period: '19 Jun 2019',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: '1st prize at HACK.GOV - Ericsson Challenge',
          period: '06 May 2019',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'Google Digital Marketing Training course',
          period: '13 May 2018',
          noBottomPadding: true,
        ),
      ],
    );
  }

  Widget get languages {
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
          noBottomPadding: true,
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

  Widget get divider {
    return Column(
      children: [
        const SizedBox(height: 40),
        Divider(
          color: Palette.mainColor,
          thickness: 2,
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
