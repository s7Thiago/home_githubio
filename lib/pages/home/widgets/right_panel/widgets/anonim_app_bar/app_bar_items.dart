import 'package:home_githubio/pages/home/views/about/about_section_view.dart';
import 'package:home_githubio/pages/home/views/contact/contact_section_view.dart';
import 'package:home_githubio/pages/home/views/projects/projects_section_view.dart';

class AppBarItems {
  static const CONTACT = 'contact';
  static const PROJECT = 'Projects';
  static const ABOUT = 'About';

  static final anonimAppBarItems = {
    AppBarItems.CONTACT: ContactSectionView(),
    AppBarItems.PROJECT: ProjectsSectionView(),
    AppBarItems.ABOUT: AboutSectionView(),
  };
}
