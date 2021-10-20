import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';

class CustomTextWithDates extends StatelessWidget {
  const CustomTextWithDates({
    Key? key,
    required this.title,
    required this.period,
    this.text,
    this.noBottomPadding = false,
  }) : super(key: key);

  final String title;
  final String? text;
  final String period;
  final bool noBottomPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '[$period]',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(color: Palette.mainColor),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 10),
                text != null
                    ? Text(
                        text!,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : const SizedBox.shrink(),
                SizedBox(height: noBottomPadding ? 0 : 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
