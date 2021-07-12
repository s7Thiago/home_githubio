import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/app_colors.dart';

class ProjectSectionView extends StatefulWidget {
  const ProjectSectionView({Key? key}) : super(key: key);

  @override
  State<ProjectSectionView> createState() => _ProjectSectionViewState();
}

class _ProjectSectionViewState extends State<ProjectSectionView> {
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
                    boxShadow: !isHovered ? elementBackgroundCenterShadow : [],
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
                child: Column(
                  children: [],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
