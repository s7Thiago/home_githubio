import 'dart:math';

import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:home_githubio/core/utils/responsive.dart';
import 'package:home_githubio/model/data/contents.dart';
import 'package:home_githubio/model/project.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/project_section_variation.dart';

class ProjectsSectionView extends StatefulWidget {
  final PageController pageController;

  const ProjectsSectionView({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  @override
  State<ProjectsSectionView> createState() => _ProjectsSectionViewState();
}

class _ProjectsSectionViewState extends State<ProjectsSectionView> {
  // final pageController = PageController(
  //   initialPage: 1,
  //   viewportFraction: .25,
  // );

  final Duration duration = new Duration(milliseconds: 500);

  int currentPage = 1;

  void updateCurrentPage(int newIndex) {
    currentPage = newIndex;
    widget.pageController.animateToPage(
      currentPage,
      duration: duration,
      curve: Curves.easeInOutQuad,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _data = Contents.texts;
    final projects = _data['projects'] as List<Project>;
    final responsive = AppResponsively(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        if (!responsive.isMobile())
          Positioned(
            bottom: 50,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      widget.pageController.animateToPage(
                        currentPage > 0
                            ? currentPage = currentPage - 1
                            : currentPage,
                        duration: duration,
                        curve: Curves.easeInOutCirc,
                      );
                    },
                    child: Icon(Icons.keyboard_arrow_left_outlined),
                  ),
                ),
                FloatingActionButton(
                  backgroundColor: Colors.black,
                  onPressed: () {
                    widget.pageController.animateToPage(
                      currentPage < projects.length
                          ? currentPage = currentPage + 1
                          : currentPage,
                      duration: duration,
                      curve: Curves.easeInOutCirc,
                    );
                  },
                  child: Icon(Icons.keyboard_arrow_right_outlined),
                ),
              ],
            ),
          ),
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 150),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Explore my projects',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w800,
                        fontSize: 45,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: PageView.builder(
                  itemCount: projects.length,
                  controller: widget.pageController,
                  scrollDirection:
                      responsive.isMobile() || responsive.isTablet()
                          ? Axis.vertical
                          : Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return AnimatedCard(
                      curve: Curves.easeOutCirc,
                      duration: Duration(
                        milliseconds: Random().nextInt(900).clamp(300, 900),
                      ),
                      direction: currentPage > index
                          ? AnimatedCardDirection.left
                          : AnimatedCardDirection.right,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 25,
                          vertical: 30,
                        ),
                        child: ProjectSectionVariation(
                          data: projects[index],
                          index: index,
                          updateCurrentPage: updateCurrentPage,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
