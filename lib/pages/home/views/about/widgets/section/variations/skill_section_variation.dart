import 'package:flutter/material.dart';

class SkillSectionVariation extends StatelessWidget {
  final Widget? iconTitleLeading;
  final Widget? iconTitleTrailing;
  final String titleText;
  final double? marginStart;

  const SkillSectionVariation({
    this.iconTitleLeading,
    this.iconTitleTrailing,
    required this.titleText,
    this.marginStart,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: marginStart ?? 75, bottom: 20),
      child: Row(
        children: [
          iconTitleLeading ?? Container(),
          SizedBox(width: 10),
          Text(titleText),
          SizedBox(width: iconTitleTrailing == null ? 0 : 16),
          iconTitleTrailing ?? Container(),
        ],
      ),
    );
  }
}
