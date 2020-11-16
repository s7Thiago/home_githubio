import 'package:flutter/material.dart';
import 'package:home_githubio/app/styles.dart';
import 'package:home_githubio/core/state/anonim_tab_bar_provider.dart';
import 'package:home_githubio/model/data/menu_items.dart';
import 'package:provider/provider.dart';

class AnonimTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AnonimTabBarProvider>(context, listen: true);

    return Material(
      color: Colors.white,
      child: Container(
        width: double.infinity,
        child: ListView.builder(
          itemCount: MenuItems.anonimTabBarItems.length,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => provider.updateIndex = index,
              child: _TabItem(
                label: MenuItems.anonimTabBarItems[index],
                selected: provider.currentIndex == index,
                size: size,
                sizeBase: MenuItems.anonimTabBarItems.length,
                index: index,
                provider: provider,
              ),
            );
          },
        ),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool selected;
  final Size size;
  final int sizeBase;
  final index;
  final AnonimTabBarProvider provider;

  const _TabItem({
    Key key,
    @required this.label,
    @required this.selected,
    @required this.size,
    @required this.sizeBase,
    @required this.index,
    @required this.provider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final radius = AppStyles.anonimTabBarSelectedItemRadius;

    return Card(
      margin: EdgeInsets.all(0.0),
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: !selected
              ? (index == provider.currentIndex + 1
                  ? Radius.circular(radius)
                  : Radius.circular(0))
              : Radius.circular(0.0),
          bottomRight: !selected
              ? (index == provider.currentIndex - 1
                  ? Radius.circular(radius)
                  : Radius.circular(0))
              : Radius.circular(0.0),
        ),
      ),
      child: Container(
        alignment: Alignment.center,
        width: (size.width / 2) / sizeBase,
        child: Text(
          label,
          style:
              selected ? AppStyles.selectItemLabel : AppStyles.normalItemLabel,
        ),
        decoration:
            selected ? AppStyles.selectedTabItem : AppStyles.normalTabItem,
      ),
    );
  }
}
