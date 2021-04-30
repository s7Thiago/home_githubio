import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/styles.dart';

class TitleSectionVariation extends StatelessWidget {
  final String titleText;
  final bool showTitleDivider;

  const TitleSectionVariation({
    Key? key,
    required this.titleText,
     this.showTitleDivider = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleText,
          textAlign: TextAlign.center,
          style: AppStyles.introTextStyle,
        ),
        showTitleDivider ? Divider() : Container(),
      ],
    );
  }
}
