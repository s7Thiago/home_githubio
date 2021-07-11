import 'package:flutter/material.dart';
import 'package:home_githubio/pages/home/views/about/widgets/section/variations/project_section_variation.dart';

class ProjectsSectionView extends StatelessWidget {
  final pageController = new PageController(
    initialPage: 1,
    keepPage: false,
    viewportFraction: .4,
  );

  int currentPage = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Text('Explore my projects'),
        ),
        Expanded(
          flex: 3,
          child: PageView.builder(
            itemCount: 4,
            controller: pageController,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 100,
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
