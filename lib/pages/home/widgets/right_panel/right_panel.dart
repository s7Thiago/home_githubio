import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/styles.dart';
import 'package:home_githubio/core/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/pages/home/widgets/anonim_app_bar/app_bar_items.dart';
import 'package:home_githubio/pages/home/widgets/anonim_app_bar/anonim_app_bar.dart';
import 'package:provider/provider.dart';

class RightPanel extends StatelessWidget {
  final Size size;

  const RightPanel({Key key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Usando o provider da barra customizada aqui
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);

    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 450),
        curve: Curves.easeInOutCirc.flipped,
        color: Colors.black,
        width: provider.selectedTab == 'Projects'
            ? size.width * .8
            : size.width * .5,
        child: Column(
          children: [
            Expanded(child: AnonimAppBar(), flex: 1),
            Expanded(child: _BodyRight(), flex: 8),
          ],
        ),
      ),
    );
  }
}

class _BodyRight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // * Usando o provider da barra customizada aqui
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);
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
      child: IndexedStack(
        alignment: Alignment.center,
        index: provider.currentIndex,
        children: AppBarItems.anonimTabBarItems.values.toList(),
      ),
    );
  }
}
