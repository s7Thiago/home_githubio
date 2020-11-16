import 'package:flutter/material.dart';
import 'package:home_githubio/core/state/anonim_tab_bar_provider.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatelessWidget {
  final Size size;

  const LeftPanel({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnonimTabBarProvider>(context, listen: true);

    return AnimatedContainer(
      duration: Duration(milliseconds: 400),
      curve: Curves.easeInOutCubic,
      width: provider.selectedTab == 'Projects'
          ? size.width * .2
          : size.width * .5,
      color: Colors.black,
    );
  }
}
