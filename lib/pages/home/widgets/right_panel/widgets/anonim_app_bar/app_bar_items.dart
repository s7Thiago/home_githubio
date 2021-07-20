import 'package:flutter/cupertino.dart';
import 'package:home_githubio/core/utils/responsive.dart';
import 'package:home_githubio/pages/home/views/about/about_section_view.dart';
import 'package:home_githubio/pages/home/views/contact/contact_section_view.dart';
import 'package:home_githubio/pages/home/views/projects/projects_section_view.dart';

class AppBarItems {
  static const CONTACT = 'contact';
  static const PROJECT = 'Projects';
  static const ABOUT = 'About';
  final BuildContext context;

  AppBarItems({required this.context});

  Map<String, Widget> get items => {
        AppBarItems.CONTACT: ContactSectionView(),
        AppBarItems.PROJECT: ProjectsSectionView(
            pageController: PageController(
          initialPage: 1,
          viewportFraction: AppResponsively(context).isMobile()
              ? .6
              : AppResponsively(context).isSmallTablet()
                  ? .7
                  : .25,
        )),
        AppBarItems.ABOUT: AboutSectionView(),
      };
}
