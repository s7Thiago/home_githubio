import 'package:flutter/widgets.dart';
import 'package:home_githubio/app/github_rest_client.dart';
import 'package:home_githubio/app/utils/responsive.dart';
import 'package:home_githubio/controllers/projects_controller.dart';
import 'package:home_githubio/pages/home/views/about/about_section_view.dart';
import 'package:home_githubio/pages/home/views/contact/contact_section_view.dart';
import 'package:home_githubio/pages/home/views/projects/projects_section_view.dart';
import 'package:home_githubio/pages/home/widgets/right_panel/widgets/anonim_app_bar/app_bar_items.dart';
import 'package:home_githubio/repositories/projects_repository_impl.dart';
import 'package:home_githubio/services/projects_service.dart';
import 'package:home_githubio/services/projects_service_impl.dart';
import 'package:provider/provider.dart';

class AnonimAppBarProvider extends ChangeNotifier {
  int _selectedIndex = 2;
  String _selectedTab = AppBarItems.ABOUT;
  final ProjectsService projectsService = ProjectsServiceImpl(
    repository: ProjectsRepositoryImpl(
      githubRestClient: GithubRestClient(),
    ),
  );

  // Acesso às páginas
  Widget get contactView => ContactSectionView();
  Widget get projectsView => Builder(
        builder: (context) => ChangeNotifierProvider<ProjectsController>(
          create: (_) => ProjectsController(projectsService: projectsService),
          child: ProjectsSectionView(
            pageController: PageController(
              initialPage: 1,
              viewportFraction: AppResponsively(context).isMobile()
                  ? .6
                  : AppResponsively(context).isSmallTablet()
                      ? .7
                      : .25,
            ),
          ),
        ),
      );
  Widget get aboutView => AboutSectionView();

  int get currentIndex => _selectedIndex;
  String get selectedTab => _selectedTab;

  set updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }

  set updateSelectedTab(String currentTab) {
    _selectedTab = currentTab;
    notifyListeners();
  }
}
