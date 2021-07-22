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
  void dispose() {
    super.dispose();
    widget.pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, Object> _data = Contents.texts;
    final projects = _data['projects'] as List<Project>;
    final responsive = AppResponsively(context);

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Positioned.fill(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                flex: 4,
                child: PageView.builder(
                  itemCount: projects.length,
                  controller: widget.pageController,
                  scrollDirection: responsive.isMobile()
                      ? Axis.vertical
                      : responsive.isSmallTablet()
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
        // ! Floating navigation buttons
        if (!responsive.isMobile())
          Positioned(
            bottom: responsive.isSmallTablet() ? 30 : 50,
            height: responsive.isSmallTablet() ? 200 : 50,
            right: responsive.isSmallTablet()
                ? 50
                : (MediaQuery.of(context).size.width * .5) * .65,
            child: RotatedBox(
              quarterTurns: responsive.isSmallTablet() ? 1 : 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      right: 25,
                      bottom: 0,
                    ),
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
          ),
        // ! Title Explore my projects
        Positioned(
          top: 0,
          left: responsive.isDesktop() || responsive.isSmallTablet() ? 50 : 0,
          child: Container(
            height: 100,
            width: MediaQuery.of(context).size.width *
                (responsive.isMobile()
                    ? 1
                    : (responsive.isDesktop() ? .4 : .7)),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [.6, .95],
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  top: responsive.isDesktop() ? 50 : 25,
                  left: responsive.isDesktop() ? 150 : 0),
              child: Align(
                alignment: responsive.isDesktop()
                    ? Alignment.centerLeft
                    : Alignment.topCenter,
                child: responsive.isDesktop()
                    ? Text(
                        'Explore my projects',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800,
                          fontSize: 45,
                        ),
                      )
                    : FittedBox(
                        child: Text(
                          'Explore my projects',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w800,
                            fontSize: 30,
                          ),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
