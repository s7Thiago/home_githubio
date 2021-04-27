import 'package:home_githubio/pages/home/views/about/about_image_view.dart';
import 'package:home_githubio/pages/home/views/contact/contact_section_view.dart';
import 'package:home_githubio/pages/home/views/projects/projects_section_view.dart';

class AppBarItems {
  static final anonimAppBarItems = {
    'Contact': ContactSectionView(),
    'Projects': ProjectsSectionView(),
    'About': AboutSectionView(),
  };
}
