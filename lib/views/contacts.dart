import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';
import 'package:url_launcher/url_launcher.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Let's keep in touch!",
          style: CustomTextStyle.h1,
        ),
        email,
        CustomDivider(),
        CustomText(
          text: "Others",
          style: CustomTextStyle.h2,
        ),
        github,
        const SizedBox(height: 10),
        linkedin,
      ],
    );
  }

  Widget get email {
    return Column(
      children: [
        CustomText(text: 'Feel free to contact me by email at any time:'),
        CustomTextWithLinkAndIcon(
          link: 'mailto:marcotammaro42@gmail.com',
          text: 'marcotammaro42@gmail.com',
          icon: FontAwesomeIcons.at,
        ),
      ],
    );
  }

  Widget get github {
    return CustomTextWithLinkAndIcon(
      link: 'https://github.com/marcotammaro/',
      icon: FontAwesomeIcons.github,
    );
  }

  Widget get linkedin {
    return CustomTextWithLinkAndIcon(
      link: 'https://www.linkedin.com/in/marcotammaro/',
      icon: FontAwesomeIcons.linkedin,
    );
  }
}
