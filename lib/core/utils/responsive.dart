import 'package:flutter/material.dart';

class AppResponsively {
  final BuildContext context;
  late Size _size;

  get size => _size;

  // Constructor
  AppResponsively(this.context) {
    _size = MediaQuery.of(context).size;
  }

  // checks if the device screen size is a mobile device
  isMobile() {
    return _size.width < 850;
  }

  // checks if the device screen size is a mobile device
  isSmallMobile() {
    return isMobile() && _size.height < 880;
  }

  // checks if the device screen size is a tablet device
  isTablet() {
    return _size.width >= 1100 && _size.width < 1600;
  }

  // checks if the device screen size is a small tablet device
  isSmallTablet() {
    return _size.width >= 850 && _size.width < 1100;
  }

  // checks if the device screen size is some mobile device
  isMobileORTablet() {
    return isMobile() || isTablet() || isSmallTablet();
  }

  // checks if the device screen size is a some tablet
  isSomeTablet() {
    return isTablet() || isSmallTablet();
  }

  // checks if the device screen size is a desktop device
  isDesktop() {
    return _size.width >= 1600;
  }
}
