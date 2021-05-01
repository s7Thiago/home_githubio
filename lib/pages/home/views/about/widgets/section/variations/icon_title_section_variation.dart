import 'package:flutter/material.dart';

import 'package:home_githubio/pages/home/views/about/widgets/section/variations/title_section_variation.dart';

class IconTitleSectionVariation extends StatelessWidget {
  final String titleText;
  final String? introText;
  final showTitleDivider;
  Widget? iconTitleLeading;
  Widget? iconTitleTrailing;
  MainAxisAlignment alignment;

  IconTitleSectionVariation({
    required this.titleText,
    this.introText = '',
    required this.iconTitleLeading,
    required this.iconTitleTrailing,
    this.alignment = MainAxisAlignment.center,
    this.showTitleDivider = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: showTitleDivider ? 16 : 12),
      width: MediaQuery.of(context).size.width * .2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: alignment,
            children: [
              iconTitleLeading ?? Container(),
              iconTitleLeading == null ? SizedBox() : SizedBox(width: 10),
              TitleSectionVariation(titleText: this.titleText),
              iconTitleTrailing == null ? SizedBox() : SizedBox(width: 10),
              iconTitleTrailing ?? Container(),
            ],
          ),
          // Divider
          Container(
            width: double.infinity,
            height: showTitleDivider ? .5 : 0,
            color: Colors.grey,
          )
        ],
      ),
    );
  }
}