import 'package:animated_card/animated_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/model/project.dart';

import '../../../../../../../core/utils/extensions.dart';

class ProjectSectionVariation extends StatefulWidget {
  final Project data;

  const ProjectSectionVariation({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<ProjectSectionVariation> createState() =>
      _ProjectSectionVariationState();
}

class _ProjectSectionVariationState extends State<ProjectSectionVariation> {
  double elementWidth = 300;
  double elementHeight = 400;
  bool isHovered = false;
  Color elementColor = Colors.white;

  final elementShadows = <BoxShadow>[
    BoxShadow(
        color: Color(0xFF2f3e46),
        offset: Offset(0, 10),
        blurRadius: 35,
        spreadRadius: 10),
  ];

  final elementBackgroundCenterShadow = <BoxShadow>[
    BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 10),
        blurRadius: 65,
        spreadRadius: 8),
  ];

  // set the size of the element to normal
  _resetElementSize() {
    elementWidth = 300;
    elementHeight = 400;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: 300);

    return Center(
      child: InkWell(
        mouseCursor: MaterialStateProperty.resolveAs<MouseCursor?>(
          MaterialStateMouseCursor.clickable,
          {},
        ),
        child: MouseRegion(
          onHover: (PointerHoverEvent phe) {
            elementColor = Color(0xFF2f3e46);
            // elementColor = Colors.white;
            elementWidth = 315.0;
            elementHeight = 410.0;
            isHovered = true;
            setState(() {});
          },
          onExit: (PointerExitEvent pee) {
            elementColor = Colors.white;
            isHovered = false;
            _resetElementSize();
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Center Shadow
              Positioned(
                top: 25,
                child: AnimatedContainer(
                  width: 230,
                  height: 340,
                  margin: const EdgeInsets.only(bottom: 2),
                  duration: duration,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    boxShadow:
                        !isHovered ? elementBackgroundCenterShadow : [],
                  ),
                ),
              ),
              // Top Shadow
              // Bottom Shadow
              AnimatedContainer(
                width: 220,
                height: 20,
                margin: const EdgeInsets.only(bottom: 2),
                duration: duration,
                decoration: BoxDecoration(
                  color: Colors.black,
                  boxShadow: isHovered ? elementShadows : [],
                ),
              ),
              AnimatedContainer(
                decoration: BoxDecoration(
                  color: elementColor,
                  borderRadius: BorderRadius.circular(10),
                  border: isHovered
                      ? Border.all(color: Colors.grey, width: .06)
                      : null,
                ),
                width: elementWidth,
                height: elementHeight,
                duration: duration,
                curve: Curves.easeInOutQuad,
                child: _Content(
                  isHovered: isHovered,
                  heading: widget.data.heading,
                  title: widget.data.title,
                  description: widget.data.description,
                  footer: widget.data.footer,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final bool isHovered;
  final String heading;
  final String title;
  final String description;
  final String footer;

  // all args constructor
  _Content({
    this.isHovered = false,
    this.heading = '',
    this.title = '',
    this.description = '',
    this.footer = '',
  });

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: 275);

    final _baseTextStyle = TextStyle(
      fontWeight: FontWeight.bold,
      color: isHovered ? Colors.white : Colors.black,
      fontSize: 20,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Container(
            width: double.maxFinite,
            child: AnimatedDefaultTextStyle(
              style: _baseTextStyle.copyWith(
                fontSize: isHovered ? 22 : 20,
              ),
              duration: duration,
              curve: Curves.easeInOutQuad,
              child: Text(heading),
            ).toCenterLeft(),
          ).expand(flex: 1),
          Container(
            width: double.maxFinite,
            alignment: Alignment.bottomLeft,
            child: AnimatedDefaultTextStyle(
              style: _baseTextStyle.copyWith(
                fontSize: isHovered ? 35 : 33,
                fontWeight: FontWeight.w900,
              ),
              duration: duration,
              curve: Curves.easeInOutQuad,
              child: Text(title),
            ).toCenterLeft(),
          ).expand(flex: 2),
          Container(
            width: double.maxFinite,
            child: AnimatedDefaultTextStyle(
              style: _baseTextStyle.copyWith(
                fontSize: isHovered ? 18 : 16,
                fontWeight: FontWeight.normal,
              ),
              duration: duration,
              curve: Curves.easeInOutQuad,
              child: Text(description),
            ).toCenterLeft(),
          ).expand(flex: 4),
          Container(
            width: double.maxFinite,
            child: AnimatedDefaultTextStyle(
              style: _baseTextStyle.copyWith(
                fontSize: isHovered ? 18 : 16,
                fontWeight: FontWeight.w100,
                color:
                    (isHovered ? Colors.white : Colors.black).withOpacity(.4),
              ),
              duration: duration,
              curve: Curves.easeInOutQuad,
              child: Text(footer),
            ).toCenterLeft(),
          ).expand(flex: 3),
        ],
      ).defaultXCardPadding(),
    );
  }
}
