import 'package:flutter/material.dart';
import 'package:home_githubio/core/state/anonim_tab_bar_provider.dart';
import 'package:home_githubio/widgets/left_panel.dart';
import 'package:home_githubio/widgets/right_panel.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => AnonimTabBarProvider(),
      child: Row(
        children: [
          LeftPanel(size: size),
          RightPanel(size: size),
        ],
      ),
    );
  }
}
