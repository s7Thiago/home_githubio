import 'package:flutter/material.dart';

class EducationSectionVariation extends StatelessWidget {
  final String introText;
  final Widget? subTitle;
  final showTitleDivider;
  final Widget? iconTitleLeading;
  final Widget? iconTitleTrailing;
  final MainAxisAlignment alignment;

  const EducationSectionVariation({
    Key? key,
    required this.introText,
    this.subTitle,
    this.showTitleDivider = true,
    this.iconTitleLeading,
    this.iconTitleTrailing,
    this.alignment = MainAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          iconTitleLeading ?? Container(),
          Container(
            width: 350,
            margin: EdgeInsets.only(
                left: iconTitleLeading != null ? 10 : 0,
                right: iconTitleTrailing != null ? 10 : 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(introText, textAlign: TextAlign.right),
                SizedBox(height: 10),
                subTitle!
              ],
            ),
          ),
          Expanded(child: iconTitleTrailing ?? Container())
        ],
      ),
    );
  }
}
