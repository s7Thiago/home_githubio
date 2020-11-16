import 'package:flutter/widgets.dart';

class AnonimTabBarProvider extends ChangeNotifier {
  int _selectedIndex = 1;

  int get currentIndex => _selectedIndex;

  set updateIndex(int newIndex) {
    _selectedIndex = newIndex;
    notifyListeners();
  }
}
