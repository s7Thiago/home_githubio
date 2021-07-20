import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:home_githubio/core/styles/app_colors.dart';

class AppStyles {
  //! Texts
  //? AnonimTabBar
  static const normalItemLabel = TextStyle(
    color: Colors.grey,
  );

  static const selectItemLabel = TextStyle(
    color: AppColors.spotlight_dark,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  //? Left Panel
  static const description1TextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25,
    fontWeight: FontWeight.w100,
  );

  static final nameTextStyle = description1TextStyle.copyWith(
    color: Colors.white,
    fontSize: 26,
    fontWeight: FontWeight.bold,
  );

  static const description2TextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w100,
  );

  // ? Contact Section
  static const qrCodeToolTip = TextStyle(
    fontSize: 17,
  );

  // ? About Section
  static final introTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: Colors.black,
  );

  //! Containers
  //?  AnonimTabBar
  static const normalTabItem = BoxDecoration(
    // color: Colors.black,
    color: Colors.transparent,
  );

  static const selectedTabItem = BoxDecoration(
    // color: Colors.lime,
    color: Colors.transparent,
  );

  //! Sizes & Radius
  //? AnonimTabBar
  static const anonimTabBarSelectedItemRadius = 40.0;
}
