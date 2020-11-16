import 'package:flutter/material.dart';
import 'package:home_githubio/widgets/left_panel.dart';
import 'package:home_githubio/widgets/right_panel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: LeftPanel()),
        Expanded(child: RightPanel()),
      ],
    );
  }
}
