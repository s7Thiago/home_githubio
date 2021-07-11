import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/project_section_variation.dart';

class ProjectsSectionView extends StatefulWidget {
  @override
  State<ProjectsSectionView> createState() => _ProjectsSectionViewState();
}

class _ProjectsSectionViewState extends State<ProjectsSectionView> {
  final pageController = new PageController(
    initialPage: 1,
    viewportFraction: .25,
  );

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.only(top: 50, left: 18),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Explore my projects'),
            ),
          ),
        ),
        Expanded(
          flex: 4,
          child: PageView.builder(
            itemCount: 4,
            controller: pageController,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 30,
                ),
                child: ProjectSectionView(),
              );
            },
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      currentPage > 0
                          ? currentPage = currentPage - 1
                          : currentPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuad,
                    );
                  },
                  child: Text('Previous')),
              TextButton(
                  onPressed: () {
                    pageController.animateToPage(
                      currentPage < 3
                          ? currentPage = currentPage + 1
                          : currentPage,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeInOutQuad,
                    );
                  },
                  child: Text('Next')),
            ],
          ),
        )
      ],
    );
  }
}
