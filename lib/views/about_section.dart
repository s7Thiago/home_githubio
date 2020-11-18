import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Svg();
  }
}

class Svg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Center(
        child: SvgPicture.asset('assets/documents/resume.svg'),
      ),
    );
  }
}
