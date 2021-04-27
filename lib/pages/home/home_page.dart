import 'package:flutter/material.dart';
import 'package:home_githubio/core/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/pages/home/widgets/left_panel/left_panel.dart';
import 'package:home_githubio/pages/home/widgets/right_panel/right_panel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ChangeNotifierProvider(
      create: (_) => AnonimAppBarProvider(),
      child: Row(
        children: [
          LeftPanel(size: size),
          RightPanel(size: size),
        ],
      ),
    );
  }
}
