import 'package:flutter/widgets.dart';
import 'package:home_githubio/pages/home/widgets/anonim_app_bar/app_bar_items.dart';

class AnonimAppBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  String _selectedTab = AppBarItems.anonimAppBarItems.keys.elementAt(0);

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
