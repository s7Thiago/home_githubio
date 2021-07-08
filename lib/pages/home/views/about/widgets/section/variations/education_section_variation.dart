import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/icon_title_section_variation.dart';

class EducationSectionVariation extends StatelessWidget {
  final String titleText;
  final String introText;
  final showTitleDivider;
  final Widget? iconTitleLeading;
  final Widget? iconTitleTrailing;
  final MainAxisAlignment alignment;

  const EducationSectionVariation({
    Key? key,
    required this.titleText,
    required this.introText,
    this.showTitleDivider = true,
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.alignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      width: MediaQuery.of(context).size.width * .2,
      child: Column(
        children: [
          IconTitleSectionVariation(
            titleText: titleText,
            showTitleDivider: true,
            iconTitleLeading: iconTitleLeading,
            iconTitleTrailing: iconTitleLeading,
            alignment: alignment,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 315,
                child: Text(introText, textAlign: TextAlign.right),
              ),
            ],
          )
        ],
      ),
    );
  }
}
