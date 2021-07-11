import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/app_colors.dart';

class ProjectSectionView extends StatelessWidget {
  const ProjectSectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        color: AppColors.spotlight,
        width: 500,
        height: 650,
        duration: Duration(milliseconds: 800),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
