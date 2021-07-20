import 'package:flutter/material.dart';
import 'package:home_githubio/core/utils/responsive.dart';
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
    final responsive = AppResponsively(context);
    final size = MediaQuery.of(context).size;

    return Container(
      width: responsive.isMobile()
          ? (size.width * .85)
          : size.width * (responsive.isTablet() ? .6 : .33),
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
