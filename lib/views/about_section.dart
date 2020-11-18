import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset('assets/documents/resume.png'),
            ],
          ),
        ),
      ),
    );
  }
}
