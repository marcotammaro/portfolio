import 'package:flutter/material.dart';
import 'package:portfolio/components/responsive.dart';
import 'package:portfolio/palette.dart';

/// A Widget to display projects information with the provided information and
/// a bottom padding of 20 removable by setting ```noBottomPadding=true```
///
/// The ```period``` text will be rounded with square brackets.
class ProjectCard extends StatefulWidget {
  const ProjectCard({
    Key? key,
    required this.name,
    required this.period,
    required this.type,
    this.description,
    this.bottomWidget,
    this.noBottomPadding = false,
  }) : super(key: key);

  final String name;
  final String period;
  final String type;
  final String? description;
  final Widget? bottomWidget;
  final bool noBottomPadding;

  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile(context) ? mobileContent : tabletContent;
  }

  Widget get tabletContent {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              period,
              const SizedBox(height: 10),
              type,
            ],
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              name,
              SizedBox(height: widget.description != null ? 10 : 0),
              description,
              const SizedBox(height: 10),
              bottomWidget,
              SizedBox(height: widget.noBottomPadding ? 0 : 20),
            ],
          ),
        ),
      ],
    );
  }

  Widget get mobileContent {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            period,
            const SizedBox(width: 10),
            type,
          ],
        ),
        const SizedBox(height: 20),
        name,
        SizedBox(height: widget.description != null ? 10 : 0),
        description,
        const SizedBox(height: 10),
        bottomWidget,
        SizedBox(height: widget.noBottomPadding ? 0 : 20),
      ],
    );
  }

  Widget get period {
    return SelectableText(
      '[${widget.period}]',
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Palette.mainColor),
    );
  }

  Widget get type {
    return SelectableText(
      widget.type,
      style: Theme.of(context)
          .textTheme
          .bodyText1!
          .copyWith(color: Palette.mainColor),
    );
  }

  Widget get name {
    return SelectableText(
      widget.name,
      style: Theme.of(context).textTheme.headline2,
    );
  }

  Widget get description {
    return widget.description != null
        ? SelectableText(
            widget.description!,
            style: Theme.of(context).textTheme.bodyText1,
          )
        : const SizedBox.shrink();
  }

  Widget get bottomWidget {
    return widget.bottomWidget != null
        ? widget.bottomWidget!
        : const SizedBox.shrink();
  }
}
