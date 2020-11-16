import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyles {
  //! Texts
  //? AnonimTabBar
  static const normalItemLabel = TextStyle(
    color: Colors.white,
  );

  static const selectItemLabel = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  //! Containers
  //?  AnonimTabBar
  static const normalTabItem = BoxDecoration(
    color: Colors.black,
  );

  static const selectedTabItem = BoxDecoration(
    color: Colors.white,
  );

  //! Sizes & Radius
  //? AnonimTabBar
  static const anonimTabBarSelectedItemRadius = 40.0;
}
