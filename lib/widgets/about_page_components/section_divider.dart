import 'package:fdottedline/fdottedline.dart';
import 'package:flutter/material.dart';

class SectionDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FDottedLine(
      color: Colors.black,
      height: double.infinity,
      strokeWidth: 3,
      dottedLength: 15,
      space: 15,
    );
  }
}
