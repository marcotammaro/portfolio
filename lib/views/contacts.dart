import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/logics/_logics.dart';
import 'package:portfolio/palette.dart';

class Contacts extends StatefulWidget {
  const Contacts({Key? key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "> ");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        others,
        CustomDivider(),
        contactForm
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
          icons: [FontAwesomeIcons.at],
        ),
      ],
    );
  }

  Widget get others {
    return Column(
      children: [
        CustomText(
          text: "Others",
          style: CustomTextStyle.h2,
        ),
        CustomTextWithLinkAndIcon(
          link: 'https://github.com/marcotammaro/',
          icons: [FontAwesomeIcons.github],
        ),
        const SizedBox(height: 10),
        CustomTextWithLinkAndIcon(
          link: 'https://www.linkedin.com/in/marcotammaro/',
          icons: [FontAwesomeIcons.linkedin],
        )
      ],
    );
  }

  Widget get contactForm {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          text: "Contact Form",
          style: CustomTextStyle.h2,
        ),
        CustomText(
          text:
              "Do you want to send me a speedy message?\nWrite it in this form; remember to add your contact info if you want a reply.",
          style: CustomTextStyle.p,
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.end,
          alignment: WrapAlignment.end,
          children: [
            Container(
              width: Responsive.mobileTabletTheshold * 0.5,
              constraints: BoxConstraints(minHeight: 150),
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Palette.secondaryColor,
              ),
              child: Container(
                padding: EdgeInsets.all(13),
                decoration: BoxDecoration(color: Palette.backgroundColor),
                child: TextFormField(
                  controller: _controller,
                  onChanged: (value) {
                    if (value.length == 0 || !value.startsWith("> ")) {
                      if (value.startsWith(">")) {
                        _controller.text = value.replaceFirst(">", "> ");
                      } else {
                        _controller.text = "> " + value;
                      }

                      _controller.selection = TextSelection.fromPosition(
                        TextPosition(offset: _controller.text.length),
                      );
                    }
                  },
                  textCapitalization: TextCapitalization.sentences,
                  readOnly: false,
                  maxLines: null,
                  cursorColor: Palette.mainColor,
                  textAlign: TextAlign.left,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Palette.mainColor),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.zero,
                    isDense: true,
                    border: InputBorder.none,
                    prefixIconConstraints: BoxConstraints(
                      minWidth: 0,
                      minHeight: 0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: FormSendButton(
                onVerifiedTap: _onContactFormSendTap,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onContactFormSendTap() {
    ContactForm.postData(
      text: _controller.text.replaceFirst('> ', ''),
    ).then((error) {
      CustomAlertDialog.show(
        context: context,
        message:
            (error == null) ? "Message sent!" : "Unable to send the message",
        buttonText: "OK",
      );
    });
    _controller.text = "> ";
  }
}
