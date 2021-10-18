import 'package:flutter/material.dart';
import 'package:portfolio/palette.dart';
import 'dart:html' as html;

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
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '[${widget.period}]',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Palette.mainColor),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.type,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Palette.mainColor),
                ),
              ],
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: Theme.of(context).textTheme.headline2,
                ),
                SizedBox(height: widget.description != null ? 10 : 0),
                widget.description != null
                    ? Text(
                        widget.description!,
                        style: Theme.of(context).textTheme.bodyText1,
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 10),
                widget.bottomWidget != null
                    ? widget.bottomWidget!
                    : const SizedBox.shrink(),
                SizedBox(height: widget.noBottomPadding ? 0 : 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}