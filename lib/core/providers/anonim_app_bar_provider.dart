import 'package:flutter/widgets.dart';
import 'package:home_githubio/pages/home/widgets/right_panel/widgets/anonim_app_bar/app_bar_items.dart';

class AnonimAppBarProvider extends ChangeNotifier {
  int _selectedIndex = 2;
  String _selectedTab = AppBarItems.ABOUT;

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
