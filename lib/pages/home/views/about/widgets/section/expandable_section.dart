import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:home_githubio/core/styles/app_colors.dart';

import '../../../../../../core/styles/styles.dart' as styles;

class ExpandableSection extends StatefulWidget {
  final String? title;
  final String content;
  final double customHeight;
  final List<Widget>? representations;

  const ExpandableSection({
    Key? key,
    this.title,
    required this.content,
    this.representations,
    this.customHeight = 520,
  }) : super(key: key);

  @override
  _ExpandableSectionState createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection>
    with SingleTickerProviderStateMixin {
  final _duration = Duration(milliseconds: 400);
  bool selected = false;
  bool isAnimating = false;
  Color? _containerColor = AppColors.white;
  Color? _titleColor = styles.AppStyles.introTextStyle.color;
  double? _titleSize = styles.AppStyles.introTextStyle.fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isAnimating = true;
          selected = !selected;
          _containerColor = Colors.white;
          _titleSize =
              styles.AppStyles.introTextStyle.fontSize! + (selected ? 7 : 0);
          _titleColor = AppColors.spotlight_dark;
        });
      },
      onTapDown: (TapDownDetails details) {
        setState(() {
          _containerColor = Colors.grey[100];
        });
      },
      child: MouseRegion(
        onHover: (PointerHoverEvent phe) {
          if (!isAnimating) {
            if (!selected) {
              setState(() {
                _containerColor = selected ? Colors.white : Colors.purple[50];
                _titleColor = AppColors.spotlight_dark;

                if (!selected) _titleSize = 25;
              });
            }
          }
        },
        onExit: (PointerExitEvent pee) {
          setState(() {
            _containerColor = Colors.white;

            if (!selected) _titleColor = styles.AppStyles.introTextStyle.color;

            if (!selected)
              _titleSize = styles.AppStyles.introTextStyle.fontSize;
          });
        },
        child: AnimatedContainer(
          duration: _duration,
          curve: Curves.easeInOutQuad,
          onEnd: () async {
            await Future.delayed(Duration(milliseconds: 1500)).then((value) {
              setState(() {
                isAnimating = false;
              });
            });
          },
          width: !selected ? 380 : 450,
          alignment: Alignment.center,
          height: !selected ? 65 : widget.customHeight,
          padding: EdgeInsets.only(
            top: selected ? 10 : 20,
            bottom: selected ? 16 : 0,
            left: 16,
          ),
          margin: const EdgeInsets.only(bottom: 30, top: 20),
          decoration: BoxDecoration(
              color: _containerColor,
              boxShadow: selected
                  ? [
                      BoxShadow(
                        color: Colors.black26,
                        offset: Offset(1.5, 1.5),
                        blurRadius: 2,
                      ),
                    ]
                  : [],
              borderRadius: BorderRadius.circular(!selected ? 10 : 8)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: AnimatedAlign(
                  duration: _duration,
                  curve: Curves.easeInOutQuad,
                  alignment:
                      selected ? Alignment.center : Alignment.centerRight,
                  child: AnimatedSize(
                    duration: _duration,
                    curve: Curves.easeInOutQuad,
                    vsync: this,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: AnimatedDefaultTextStyle(
                        duration: Duration(milliseconds: 250),
                        curve: Curves.easeInOutQuad,
                        style: styles.AppStyles.introTextStyle.copyWith(
                          fontSize: _titleSize! - 3,
                          color: _titleColor,
                        ),
                        child: Text(
                          widget.title!,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (selected)
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: Markdown(
                          data: widget.content,
                          styleSheet: MarkdownStyleSheet(
                              textAlign: WrapAlignment.spaceBetween,
                              strong: TextStyle(
                                color: AppColors.spotlight,
                              )),
                        ),
                      ),
                      widget.representations!.length > 0
                          ? Expanded(
                              flex: 1,
                              child: IconTheme(
                                data: IconThemeData(
                                  color: Colors.grey.withOpacity(.5),
                                  size: 25,
                                ),
                                child: Wrap(
                                  runAlignment: WrapAlignment.start,
                                  alignment: WrapAlignment.spaceAround,
                                  spacing: 25,
                                  runSpacing: 100,
                                  direction: Axis.horizontal,
                                  children: widget.representations!,
                                ),
                              ),
                            )
                          : Container(),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
