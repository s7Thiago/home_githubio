import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/icon_title_section_variation.dart';

class ExperienceSectionVariation extends StatelessWidget {
  final String titleText;
  final String? introText;
  final showTitleDivider;
  final Widget? iconTitleLeading;
  final Widget? iconTitleTrailing;
  final MainAxisAlignment alignment;
  final TextAlign textAlign;
  final List<Widget> representations;
  final String content;

  ExperienceSectionVariation({
    required this.titleText,
    this.introText,
    this.iconTitleLeading,
    this.iconTitleTrailing,
    required this.alignment,
    this.showTitleDivider = false,
    this.textAlign = TextAlign.right,
    this.representations = const <Widget>[],
    this.content = 'No Content Added',
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 10,
            child: Column(
              children: [
                IconTitleSectionVariation(
                  titleText: this.titleText,
                  alignment: this.alignment,
                  iconTitleLeading: this.iconTitleLeading,
                  iconTitleTrailing: this.iconTitleTrailing,
                  showTitleDivider: this.showTitleDivider,
                ),
                Padding(
                  padding: representations.length > 0
                      // Caso haja representações, a margem é apenas na esquerda
                      ? const EdgeInsets.only(left: 50)
                      :
                      // Caso não haja representações, a margem esquerda é maior
                      const EdgeInsets.only(
                          left: 70,
                          right: 50,
                        ),
                  child: SelectableText(
                    content,
                    textAlign: textAlign,
                  ),
                )
              ],
            ),
          ),
          // Neste ponto, são mostradas as imagens de representação para cada experiencia
          representations.length > 0
              ? Expanded(
                  flex: 1,
                  child: IconTheme(
                    data: IconThemeData(
                      color: Colors.grey.withOpacity(.5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [...representations],
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
