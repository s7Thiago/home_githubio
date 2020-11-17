import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AppStyles {
  //! Texts
  //? AnonimTabBar
  static const normalItemLabel = TextStyle(
    color: Colors.grey,
  );

  static const selectItemLabel = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
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
