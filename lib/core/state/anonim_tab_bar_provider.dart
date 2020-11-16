import 'package:flutter/widgets.dart';
import 'package:home_githubio/model/data/menu_items.dart';

class AnonimTabBarProvider extends ChangeNotifier {
  int _selectedIndex = 1;
  String _selectedTab = MenuItems.anonimTabBarItems[1];

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
