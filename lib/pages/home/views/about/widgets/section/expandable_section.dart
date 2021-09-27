import 'dart:math';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:home_githubio/app/styles/app_colors.dart';
import 'package:home_githubio/app/utils/responsive.dart';
import 'package:home_githubio/controllers/expandable_section_controller.dart';
import 'package:provider/provider.dart';

import '../../../../../../app/styles/styles.dart' as styles;

class ExpandableSection extends StatelessWidget {
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

  // waits a determined time before get the Section representation
  Future<List<Widget>> _getSectionRepresentation() async =>
      Future.delayed(Duration(milliseconds: 150))
          .then((value) => representations!);

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsively(context);
    final controller = Provider.of<ExpandableSectionController>(context);
    final _duration = Duration(milliseconds: 400);

    return InkWell(
      mouseCursor: MaterialStateProperty.resolveAs<MouseCursor?>(
        MaterialStateMouseCursor.clickable,
        {},
      ),
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: responsive.isMobile() ? 16 : 0),
        child: GestureDetector(
          onTap: () {
            // isAnimating = true;
            // selected = !selected;
            // _containerColor = Colors.white;
            // _titleColor = AppColors.spotlight_dark;
            // _titleSize =
            //     styles.AppStyles.introTextStyle.fontSize! + (selected ? 7 : 0);

            controller.toggleAnimating();
            controller.toggleSelected();
            controller.updateContainerColor(Colors.white);
            controller.updateTitleColor(AppColors.spotlight_dark);
            controller.updateTitleSize(22 + (controller.selected ? 7 : 0));
          },
          onTapDown: (TapDownDetails details) {
            controller.updateContainerColor(Colors.grey[100]);
          },
          child: MouseRegion(
            onHover: (PointerHoverEvent phe) {
              if (!controller.isAnimating) {
                if (!controller.selected) {
                  controller.updateContainerColor(
                      controller.selected ? Colors.white : Colors.purple[50]);
                  controller.updateTitleColor(AppColors.spotlight_dark);

                  if (!controller.selected) controller.updateTitleSize(25);
                }
              }
            },
            onExit: (PointerExitEvent pee) {
              controller.updateContainerColor(Colors.white);

              if (!controller.selected)
                controller
                    .updateTitleColor(styles.AppStyles.introTextStyle.color);

              if (!controller.selected)
                controller
                    .updateTitleSize(styles.AppStyles.introTextStyle.fontSize);
            },
            child: AnimatedContainer(
              duration: _duration,
              curve: Curves.easeInOutQuad,
              onEnd: () async {
                await Future.delayed(Duration(milliseconds: 1500))
                    .then((value) {
                  controller.toggleAnimating();
                });
              },
              width: !controller.selected ? 380 : 450,
              alignment: Alignment.center,
              height: !controller.selected ? 65 : customHeight,
              padding: EdgeInsets.only(
                top: controller.selected ? 10 : 20,
                bottom: controller.selected ? 16 : 0,
                left: 16,
              ),
              margin: const EdgeInsets.only(bottom: 30, top: 20),
              decoration: BoxDecoration(
                  color: controller.containerColor,
                  boxShadow: controller.selected
                      ? [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(1.5, 1.5),
                            blurRadius: 2,
                          ),
                        ]
                      : [],
                  borderRadius:
                      BorderRadius.circular(!controller.selected ? 10 : 8)),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: AnimatedAlign(
                      duration: _duration,
                      curve: Curves.easeInOutQuad,
                      alignment: controller.selected
                          ? Alignment.center
                          : (responsive.isMobile()
                              ? Alignment.center
                              : Alignment.centerRight),
                      child: AnimatedSize(
                        duration: _duration,
                        curve: Curves.easeInOutQuad,
                        // vsync: this,
                        child: FittedBox(
                          fit: BoxFit.fitHeight,
                          child: AnimatedDefaultTextStyle(
                            duration: Duration(milliseconds: 250),
                            curve: Curves.easeInOutQuad,
                            style: styles.AppStyles.introTextStyle.copyWith(
                              fontSize: controller.titleSize! - 3,
                              color: controller.titleColor,
                            ),
                            child: Text(
                              title!,
                              textAlign: responsive.isMobile()
                                  ? TextAlign.center
                                  : TextAlign.right,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (controller.selected)
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Markdown(
                              data: content,
                              styleSheet: MarkdownStyleSheet(
                                  textAlign: WrapAlignment.spaceBetween,
                                  strong: TextStyle(
                                    color: AppColors.spotlight,
                                  )),
                            ),
                          ),
                          representations!.length > 0
                              ? Expanded(
                                  child: IconTheme(
                                    data: IconThemeData(
                                      color: Colors.grey.withOpacity(.5),
                                      size: 25,
                                    ),
                                    child: Align(
                                      alignment: representations!.length == 1
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
                                              spacing:
                                                  representations!.length == 1
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
                                                        curve: Curves
                                                            .easeInOutQuint,
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
      ),
    );
  }
}
