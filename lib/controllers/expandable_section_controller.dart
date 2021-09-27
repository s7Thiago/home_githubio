import 'package:flutter/cupertino.dart';
import 'package:home_githubio/app/styles/app_colors.dart';
import 'package:home_githubio/app/styles/styles.dart' as appStyles;

class ExpandableSectionController extends ChangeNotifier {
  // booleans
  bool isAnimating = false;
  bool selected = false;

  // Colors
  Color? containerColor = AppColors.white;
  Color? titleColor = appStyles.AppStyles.introTextStyle.color;

  // Sizes
  double? titleSize = appStyles.AppStyles.introTextStyle.fontSize;

  void toggleAnimating() {
    isAnimating = !isAnimating;
    notifyListeners();
  }

  void toggleSelected() {
    selected = !selected;
    notifyListeners();
  }

  void updateContainerColor(Color? newColor) {
    containerColor = newColor;
    notifyListeners();
  }

  void updateTitleColor(Color? newColor) {
    titleColor = newColor;
    notifyListeners();
  }

  void updateTitleSize(double? newSize) {
    titleSize = newSize;
    notifyListeners();
  }
}
