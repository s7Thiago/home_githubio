import 'package:flutter/material.dart';
import 'package:home_githubio/app/styles.dart';
import 'package:home_githubio/core/state/anonim_tab_bar_provider.dart';
import 'package:home_githubio/widgets/anonim_tab_bar.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: ChangeNotifierProvider(
        create: (_) => AnonimTabBarProvider(),
        child: Column(
          children: [
            Flexible(child: AnonimTabBar(), flex: 1),
            Flexible(child: _BodyRight(), flex: 8),
          ],
        ),
      ),
    );
  }
}

class _BodyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnonimTabBarProvider>(context, listen: true);
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: provider.currentIndex == 0
              ? Radius.circular(0.0)
              : Radius.circular(AppStyles.anonimTabBarSelectedItemRadius),
        ),
      ),
      margin: EdgeInsets.all(0.0),
      elevation: 0.0,
      color: Colors.white,
      child: Container(),
    );
  }
}
