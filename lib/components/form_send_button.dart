import 'dart:async';
import 'package:flutter/material.dart';
import 'package:portfolio/components/_components.dart';
import 'package:portfolio/palette.dart';

/// A BorderedButton with the ability of detecting redundant tap on the button.
/// If the tap is redundant only ```onTap``` will be triggered otherwise both ```onTap```
/// and ```onVerifiedTap``` will be triggered.
///
/// The time is setted to 10 seconds; for example if user tap twice within 10 seconds
/// only the first one will be verified and the second one will be considered as redundant.
///
/// If a redundant click is detected, an alert will be displayed.
class FormSendButton extends StatefulWidget {
  const FormSendButton({Key? key, required this.onVerifiedTap, this.onTap})
      : super(key: key);

  final VoidCallback onVerifiedTap;
  final VoidCallback? onTap;

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
        if (widget.onTap != null) widget.onTap!();
        if (isRedundentClick) return;
        widget.onVerifiedTap();
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
      CustomAlertDialog.show(
        context: context,
        message: 'Please do not spam!',
        buttonText: 'OK, sorry',
      );
      return true;
    }

    _lastOnTap = now;
    return false;
  }
}
