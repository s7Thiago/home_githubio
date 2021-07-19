import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/title_section_variation.dart';

class IntroSectionVariation extends StatelessWidget {
  final String titleText;
  final String introText;
  final showTitleDivider;

  const IntroSectionVariation({
    required this.titleText,
    required this.introText,
    this.showTitleDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .33,
      child: Column(
        children: [
          TitleSectionVariation(
            titleText: this.titleText,
            showTitleDivider: this.showTitleDivider,
          ),
          SelectableText(
            this.introText,
            textAlign: TextAlign.center,
            showCursor: false,
          ),
        ],
      ),
    );
  }
}
