import 'dart:math';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:home_githubio/core/styles/app_colors.dart';
import 'package:home_githubio/core/utils/responsive.dart';

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

  // waits a determined time before get the Section representation
  Future<List<Widget>> _getSectionRepresentation() async =>
      Future.delayed(Duration(milliseconds: 150))
          .then((value) => widget.representations!);

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsively(context);

    return InkWell(
      mouseCursor: MaterialStateProperty.resolveAs<MouseCursor?>(
        MaterialStateMouseCursor.clickable,
        {},
      ),
      child: GestureDetector(
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

              if (!selected)
                _titleColor = styles.AppStyles.introTextStyle.color;

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
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: AnimatedAlign(
                    duration: _duration,
                    curve: Curves.easeInOutQuad,
                    alignment: selected
                        ? Alignment.center
                        : (responsive.isMobile()
                            ? Alignment.center
                            : Alignment.centerRight),
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
                            textAlign: responsive.isMobile()
                                ? TextAlign.center
                                : TextAlign.right,
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
                                child: IconTheme(
                                  data: IconThemeData(
                                    color: Colors.grey.withOpacity(.5),
                                    size: 25,
                                  ),
                                  child: Align(
                                    alignment:
                                        widget.representations!.length == 1
                                            ? Alignment.topCenter
                                            : Alignment.center,
                                    child: FutureBuilder(
                                      future: _getSectionRepresentation(),
                                      builder: (context,
                                          AsyncSnapshot<List<Widget>>
                                              snapshot) {
                                        if (snapshot.hasData) {
                                          return Wrap(
                                            direction: Axis.horizontal,
                                            spacing: widget.representations!
                                                        .length ==
                                                    1
                                                ? 0
                                                : 85,
                                            children: snapshot.data!
                                                .map(
                                                  (e) => Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      bottom: 80,
                                                      top: 20,
                                                    ),
                                                    child: AnimatedCard(
                                                      child: e,
                                                      curve:
                                                          Curves.easeInOutQuint,
                                                      duration: Duration(
                                                        milliseconds: Random()
                                                            .nextInt(1200)
                                                            .clamp(500, 1200),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                          );
                                        }

                                        return SizedBox(
                                            /*      child: CircularProgressIndicator(),
                                          width: 16,
                                          height: 16, */
                                            );
                                      },
                                    ),
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
      ),
    );
  }
}
