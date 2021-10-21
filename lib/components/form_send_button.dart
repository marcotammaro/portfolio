import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';

class FormSendButton extends StatefulWidget {
  const FormSendButton({Key? key, required this.onVerifiedPress})
      : super(key: key);

  final VoidCallback onVerifiedPress;

  @override
  _FormSendButtonState createState() => _FormSendButtonState();
}

class _FormSendButtonState extends State<FormSendButton> {
  DateTime? _lastOnTap;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BorderedButton(
      title: "Send",
      heigth: 50,
      removeMargins: true,
      onTap: () {
        // if (isRedundentClick) return;
        widget.onVerifiedPress();
      },
    );
  }

  bool get isRedundentClick {
    DateTime now = DateTime.now();
    if (_lastOnTap == null) {
      _lastOnTap = now;
      return false;
    }
    if (now.difference(_lastOnTap!).inSeconds < 10) {
      _showMyDialog();
      return true;
    }

    _lastOnTap = now;
    return false;
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Palette.backgroundColor,
          content: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Please do not spam!',
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          actions: <Widget>[
            BorderedButton(
              title: 'OK, sorry',
              heigth: 50,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
