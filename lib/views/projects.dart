import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';
import 'package:url_launcher/url_launcher.dart';

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
          text:
              "Have fun discovering which projects I was most passionate about in my journey into the world of programming.",
        ),
        CustomText(
            text:
                "Not all projects are listed below, you can still find them all on my github page:"),
        GestureDetector(
          onTap: () => launch(
            'https://github.com/marcotammaro',
            forceSafariVC: false,
            forceWebView: false,
            headers: <String, String>{'my_header_key': 'my_header_value'},
          ),
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Text(
              "https://github.com/marcotammaro",
              textAlign: TextAlign.left,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(decoration: TextDecoration.underline),
            ),
          ),
        ),
      ],
    );
  }

  Widget get portfolioProject {
    return ProjectCard(
      name: "Portfolio - This website",
      period: "2021 - On Going",
      type: "Webpage",
      bottomWidget: Row(
        children: [
          Icon(
            FontAwesomeIcons.github,
            color: Palette.secondaryColor,
            size: 28,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => launch(
              'https://github.com/marcotammaro/portfolio',
              forceSafariVC: false,
              forceWebView: false,
              headers: <String, String>{'my_header_key': 'my_header_value'},
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "https://github.com/marcotammaro/portfolio",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
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
      bottomWidget: Row(
        children: [
          Icon(
            FontAwesomeIcons.appStoreIos,
            color: Palette.secondaryColor,
            size: 28,
          ),
          const SizedBox(width: 10),
          Icon(
            FontAwesomeIcons.googlePlay,
            color: Palette.secondaryColor,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => launch(
              'https://bit.ly/3ooIvfG',
              forceSafariVC: false,
              forceWebView: false,
              headers: <String, String>{'my_header_key': 'my_header_value'},
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "https://bit.ly/3ooIvfG",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget get wwdcProject {
    return ProjectCard(
      name: "WWDC 2020",
      period: "2020",
      type: "Swift Playground",
      description:
          "A PlaygroundBook to get people interested in the world of computer components not by disassembling perfectly working PCs (maybe this is not the best idea), instead by using a Playground Book to let them interact with a simplified version of a computer.",
      bottomWidget: Row(
        children: [
          Icon(
            FontAwesomeIcons.github,
            color: Palette.secondaryColor,
            size: 28,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => launch(
              'https://github.com/marcotammaro/WWDC20-Winner',
              forceSafariVC: false,
              forceWebView: false,
              headers: <String, String>{'my_header_key': 'my_header_value'},
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "https://github.com/marcotammaro/WWDC20-Winner",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
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
      bottomWidget: Row(
        children: [
          Icon(
            FontAwesomeIcons.appStoreIos,
            color: Palette.secondaryColor,
            size: 28,
          ),
          const SizedBox(width: 20),
          GestureDetector(
            onTap: () => launch(
              'https://apple.co/3nbERnk',
              forceSafariVC: false,
              forceWebView: false,
              headers: <String, String>{'my_header_key': 'my_header_value'},
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: Text(
                "https://apple.co/3nbERnk",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
