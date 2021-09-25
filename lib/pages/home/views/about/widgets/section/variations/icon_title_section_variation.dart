import 'package:flutter/material.dart';
import 'package:home_githubio/app/utils/responsive.dart';

import 'package:home_githubio/pages/home/views/about/widgets/section/variations/title_section_variation.dart';

class IconTitleSectionVariation extends StatelessWidget {
  final String titleText;
  final String? introText;
  final showTitleDivider;
  final Widget? iconTitleLeading;
  final Widget? iconTitleTrailing;
  final MainAxisAlignment alignment;

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
    final responsive = AppResponsively(context);

    return Container(
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: showTitleDivider ? 16 : 12),
      width:
          MediaQuery.of(context).size.width * (responsive.isMobile() ? .4 : .3),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: alignment,
              children: [
                iconTitleLeading ?? Container(),
                iconTitleLeading == null ? SizedBox() : SizedBox(width: 10),
                TitleSectionVariation(titleText: this.titleText),
                iconTitleTrailing == null ? SizedBox() : SizedBox(width: 10),
                iconTitleTrailing ?? Container(),
              ],
            ),
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
