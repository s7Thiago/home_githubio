import 'package:flutter/material.dart';

class AppResponsively {
  final BuildContext context;
  late Size _size;

  // Constructor
  AppResponsively(this.context) {
    _size = MediaQuery.of(context).size;
  }

  // checks if the device screen size is a mobile device
  isMobile() {
    return _size.width < 800;
  }

  // checks if the device screen size is a tablet device
  isTablet() {
    return _size.width >= 800 && _size.width < 1320;
  }

  // checks if the device screen size is a desktop device
  isDesktop() {
    return _size.width >= 1320;
  }
}
