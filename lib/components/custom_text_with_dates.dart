import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';

class CustomTextWithDates extends StatefulWidget {
  const CustomTextWithDates({
    Key? key,
    required this.title,
    required this.text,
    required this.period,
    this.noBottomPadding = false,
  }) : super(key: key);

  final String title;
  final String text;
  final String period;
  final bool noBottomPadding;

  @override
  _CustomTextWithDatesState createState() => _CustomTextWithDatesState();
}

class _CustomTextWithDatesState extends State<CustomTextWithDates> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              '[${widget.period}]',
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
                  widget.title,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 10),
                Text(
                  widget.text,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: widget.noBottomPadding ? 0 : 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
