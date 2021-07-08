import 'package:flutter/material.dart';

enum DividerType { Vertical, Horizontal }

class SectionDivider extends StatelessWidget {
  final DividerType dividerType;
  final int dotsCount;
  final double dotRadius;
  final double dotDistance;
  final Color dotColor;
  final List<double> dotSize;

  SectionDivider({
    this.dividerType = DividerType.Vertical,
    this.dotsCount = 20,
    this.dotRadius = 2.5,
    this.dotSize = const [2, 12],
    this.dotDistance = 4,
    this.dotColor = Colors.black,
  }) : assert(dotSize.length == 2);

  @override
  Widget build(BuildContext context) {
    switch (this.dividerType) {
      case DividerType.Vertical:
        return Column(
          children: List.generate(
            this.dotsCount,
            (index) => Container(
              width: this.dotSize[0],
              height: this.dotSize[1],
              margin: EdgeInsets.symmetric(vertical: this.dotDistance),
              decoration: BoxDecoration(
                color: this.dotColor,
                borderRadius: BorderRadius.circular(this.dotRadius),
              ),
            ),
          ),
        );
      case DividerType.Horizontal:
        return Row(
          children: List.generate(
            this.dotsCount,
            (index) => Container(
              width: this.dotSize[1],
              height: this.dotSize[0],
              margin: EdgeInsets.symmetric(horizontal: this.dotDistance),
              decoration: BoxDecoration(
                color: this.dotColor,
                borderRadius: BorderRadius.circular(this.dotRadius),
              ),
            ),
          ),
        );
    }
  }
}
