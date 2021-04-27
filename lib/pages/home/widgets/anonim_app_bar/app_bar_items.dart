import 'package:home_githubio/pages/home/views/about/about_image_view.dart';
import 'package:home_githubio/pages/home/views/contact/contact_view.dart';
import 'package:home_githubio/pages/home/views/projects/projects_view.dart';

class AppBarItems {
  static final anonimTabBarItems = {
    'About': AboutSectionView(),
    'Projects': ProjectsView(),
    'Contact': ContactView(),
  };
}
