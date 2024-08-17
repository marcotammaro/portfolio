import 'package:flutter/material.dart';
import 'package:portfolio/components/_components.dart';

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
        CustomDivider(),
        experiences,
        CustomDivider(),
        education,
        CustomDivider(),
        certifications,
        CustomDivider(),
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
          noBottomPadding: true,
          text:
              '''I am a $age year-old Italian software engineer with a passion for developing native applications for Apple platforms.

I consider myself a technology enthusiast, drawn to everything that operates on the binary principles of 0s and 1s and can be programmed or built by hand.

I have a deep passion for programming, ranging from low-level programming languages to high-level languages. I am particularly in love with the Swift programming language and occasionally, I also spend time working with the ESP32 microcontroller, AWS, and Docker.''',
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
          title: 'System Management S.p.A',
          titleLink: 'https://sysmanagement.it/',
          text: 'Mobile Engineer',
          period: '2022 - On Going',
        ),
        CustomTextWithDates(
          title: 'Accenture Cyber Hackademy',
          titleLink: 'https://cyberhackademy.unina.it/',
          text: 'Student',
          period: '2021',
        ),
        CustomTextWithDates(
          noBottomPadding: true,
          title: 'Apple Developer Academy',
          titleLink: 'https://www.developeracademy.unina.it/it/',
          text: 'Student (1st year) + Pier Student (2nd year)',
          period: '2018 - 2020',
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
          text:
              "Master's Degree in Software Engineering\nGrade: 110/110 cum laude\nThesis title: \"Automated OSINT: a modular backend system for seamless tools integration and data retrieval\"",
          period: '2021 - 2024',
        ),
        CustomTextWithDates(
          title: 'Università degli Studi di Napoli "Federico II"',
          text:
              "Bachelor's Degree in Software Engineering\nThesis title: \"Adversary emulation techniques for cyersecurity assessment\"",
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
          title: 'AWS - Certified Cloud Practitioner',
          period: '17 Jul 2024',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title:
              'Palo Alto Networks - Prisma Access SASE Security: Design and Operation',
          period: '18 Sep 2021',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'Palo Alto Networks - Panorama 9.0: Manage Firewalls at Scale',
          period: '20 Jul 2021',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'Apple WWDC 2020 Swift Student Challenge Winner',
          period: '16 Jun 2020',
          noBottomPadding: true,
        ),
        CustomTextWithDates(
          title: 'GDPR Regulation',
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
          title: 'Google Digital Marketing Training Course',
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
          asterisk: true,
        ),
        CustomText(
          noBottomPadding: true,
          text: "English",
          style: CustomTextStyle.p,
          asterisk: true,
        ),
      ],
    );
  }
}
