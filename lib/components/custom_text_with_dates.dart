import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive.dart';
import 'package:portfolio/palette.dart';

class CustomTextWithDates extends StatefulWidget {
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
  State<CustomTextWithDates> createState() => _CustomTextWithDatesState();
}

class _CustomTextWithDatesState extends State<CustomTextWithDates> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Responsive.isMobile(context) ? mobileContent : tabletContent);
  }

  Widget get tabletContent {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: period),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              const SizedBox(height: 10),
              text,
              SizedBox(height: widget.noBottomPadding ? 0 : 20),
            ],
          ),
        )
      ],
    );
  }

  Widget get mobileContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        period,
        const SizedBox(width: 20, height: 20),
        title,
        const SizedBox(
          height: 10,
          width: double.infinity,
        ),
        text,
        SizedBox(height: widget.noBottomPadding ? 0 : 20),
      ],
    );
  }

  Widget get period {
    return Text(
      '[${widget.period}]',
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Palette.mainColor),
    );
  }

  Widget get title {
    return Text(
      widget.title,
      style: Theme.of(context).textTheme.headline3,
    );
  }

  Widget get text {
    return widget.text != null
        ? Text(
            widget.text!,
            style: Theme.of(context).textTheme.bodyText1,
          )
        : const SizedBox.shrink();
  }
}
