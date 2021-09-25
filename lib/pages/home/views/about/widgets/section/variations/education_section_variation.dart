import 'package:flutter/material.dart';

class EducationSectionVariation extends StatelessWidget {
  final String introText;
  final Widget? subTitle;
  final showTitleDivider;
  final Widget? iconTitleLeading;
  final Widget? iconTitleTrailing;
  final MainAxisAlignment alignment;
  final CrossAxisAlignment crossAlignment;
  final TextAlign textAlign;

  const EducationSectionVariation({
    Key? key,
    required this.introText,
    this.subTitle,
    this.showTitleDivider = true,
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.alignment = MainAxisAlignment.start,
    this.crossAlignment = CrossAxisAlignment.end,
    this.textAlign = TextAlign.right,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Container(
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          iconTitleLeading ?? Container(),
          Container(
            width: 350,
            margin: EdgeInsets.only(
                left: iconTitleLeading != null ? 10 : 0,
                right: iconTitleTrailing != null ? 10 : 0),
            child: Column(
              crossAxisAlignment: crossAlignment,
              mainAxisAlignment: alignment,
              children: [
                Text(introText, textAlign: textAlign),
                SizedBox(height: 10),
                subTitle!
              ],
            ),
          ),
          iconTitleTrailing ?? Container()
        ],
      ),
    );
  }
}
