import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  _ProjectsState createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        intro,
        CustomDivider(),
        portfolioProject,
        CustomDivider(),
        uniuProject,
        CustomDivider(),
        weatherDashboardProject,
        CustomDivider(),
        wwdcProject,
        CustomDivider(),
        perkappProject,
      ],
    );
  }

  Widget get intro {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Some of my projects...",
          style: CustomTextStyle.h1,
        ),
        CustomText(
          text: '''
Have fun discovering which projects I was most passionate about in my journey into the world of programming.

Not all projects are listed below, you can still find them all on my github page:
          ''',
        ),
        CustomTextWithLinkAndIcon(
          link: 'https://github.com/marcotammaro',
        ),
      ],
    );
  }

  Widget get portfolioProject {
    return ProjectCard(
      name: "Portfolio - This website",
      period: "2021 - On Going",
      type: "Webpage",
      bottomWidget: CustomTextWithLinkAndIcon(
        link: 'https://github.com/marcotammaro/portfolio',
        icons: [FontAwesomeIcons.github],
      ),
    );
  }

  Widget get uniuProject {
    return ProjectCard(
      name: "UniU - L'Università Smart",
      period: "2019 - On Going",
      type: "iOS and Android App",
      description:
          "UniU brings your university to your smartphone.\nEverything you need at your fingertips: consult the data relating to your university career, your average, your grades, exams taken and those missing and much more.",
      bottomWidget: CustomTextWithLinkAndIcon(
        link: 'https://bit.ly/3ooIvfG',
        icons: [FontAwesomeIcons.appStoreIos, FontAwesomeIcons.googlePlay],
      ),
    );
  }

  Widget get weatherDashboardProject {
    return ProjectCard(
      name: "M5Paper - Modern Weather Dashboard",
      period: "2022",
      type: "ESP32 Project",
      bottomWidget: CustomTextWithLinkAndIcon(
        link:
            'https://github.com/marcotammaro/M5Paper---Modern-Weather-Dashboard',
        icons: [FontAwesomeIcons.github],
      ),
    );
  }

  Widget get wwdcProject {
    return ProjectCard(
      name: "What’s in my PC",
      period: "2020",
      type: "Swift Playground",
      description:
          "Winner of WWDC2020 this is a PlaygroundBook used to get people interested in the world of computer components not by disassembling perfectly working PCs (maybe this is not the best idea), instead by using a PlaygroundBook to let them interact with a simplified version of a computer.",
      bottomWidget: CustomTextWithLinkAndIcon(
        link: 'https://github.com/marcotammaro/WWDC20-Winner',
        icons: [FontAwesomeIcons.github],
      ),
    );
  }

  Widget get perkappProject {
    return ProjectCard(
      name: "Perkapp",
      period: "2019",
      type: "iOS App",
      description:
          "PerkApp focuses on motivating you by encouraging you to keep track of your progress at work and by sending you personalised notifications to remind you of your achievements.",
      bottomWidget: CustomTextWithLinkAndIcon(
        link: 'https://apple.co/3nbERnk',
        icons: [FontAwesomeIcons.appStoreIos],
      ),
    );
  }
}
