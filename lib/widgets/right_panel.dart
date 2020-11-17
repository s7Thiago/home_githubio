import 'package:flutter/material.dart';
import 'package:home_githubio/app/styles.dart';
import 'package:home_githubio/core/state/anonim_tab_bar_provider.dart';
import 'package:home_githubio/model/data/menu_items.dart';
import 'package:home_githubio/views/contact_section.dart';
import 'package:home_githubio/widgets/anonim_tab_bar.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatelessWidget {
  final Size size;

  const RightPanel({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnonimTabBarProvider>(context, listen: true);

    return AnimatedContainer(
      duration: Duration(milliseconds: 350),
      curve: Curves.easeInOutCubic,
      color: Colors.black,
      width: provider.selectedTab == 'Projects'
          ? size.width * .8
          : size.width * .5,
      child: Column(
        children: [
          Expanded(child: AnonimTabBar(), flex: 1),
          Expanded(child: _BodyRight(), flex: 8),
        ],
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
      child: Container(
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.center,
        child: IndexedStack(
          alignment: Alignment.center,
          index: provider.currentIndex,
          children: MenuItems.anonimTabBarItems.values.toList(),
        ),
      ),
    );
  }
}
