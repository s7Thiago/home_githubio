import 'package:flutter/material.dart';

extension AppExtensions on Widget {
  onFlex({flex = 1}) => Flexible(flex: flex, child: this);
  expand({flex = 1}) => Expanded(flex: flex, child: this);
  toCenter() => Center(child: this);
  toCenterLeft() => Align(alignment: Alignment.centerLeft, child: this);
  toCenterRight() => Align(alignment: Alignment.centerRight, child: this);

  defaultXCardPadding() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: this,
      );
}
