import 'package:flutter/material.dart';

import '../palette.dart';
import '_components.dart';

class CustomAlertDialog {
  static Future show({
    required BuildContext context,
    required String message,
    required String buttonText,
  }) async {
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
                message,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
          ),
          actions: <Widget>[
            BorderedButton(
              title: buttonText,
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
