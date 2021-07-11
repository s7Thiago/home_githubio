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
  double elementHeight = 455;
  bool isHovered = !!false; // ! Change to false

  final elementShadows = <BoxShadow>[
    BoxShadow(
        color: Colors.grey,
        offset: Offset(0, 10),
        blurRadius: 35,
        spreadRadius: 10),
  ];

  // set the size of the element to normal
  _resetElementSize() {
    elementWidth = 300;
    elementHeight = 455;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final duration = Duration(milliseconds: 400);

    return Center(
      child: MouseRegion(
        onHover: (PointerHoverEvent phe) {
          elementWidth = 325.0;
          elementHeight = 470.0;
          isHovered = true;
          setState(() {});
        },
        onExit: (PointerExitEvent pee) {
          isHovered = !!false; //! Change to false
          _resetElementSize();
        },
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            AnimatedContainer(
              width: 220,
              height: 20,
              duration: duration,
              decoration: BoxDecoration(
                color: Colors.black,
                boxShadow: isHovered ? elementShadows : [],
              ),
            ),
            AnimatedContainer(
              decoration: BoxDecoration(
                color: AppColors.spotlight,
                borderRadius: BorderRadius.circular(10),
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
    );
  }
}
