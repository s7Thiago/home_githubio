import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/styles.dart';
import 'package:home_githubio/core/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/pages/home/widgets/anonim_app_bar/app_bar_items.dart';
import 'package:provider/provider.dart';

class AnonimAppBarOlder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);

    return Container(
      alignment: Alignment.bottomCenter,
      width: size.width * .5, //! Gambiarra
      color: Colors.black, // ?Impacta na cor de fundo da tab selecionada
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: AppBarItems.anonimAppBarItems.length,
        scrollDirection: Axis.horizontal,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              provider.updateIndex = index;
              provider.updateSelectedTab = AppBarItems.anonimAppBarItems.keys
                  .elementAt(provider.currentIndex);
            },
            child: _TabItem(
              label: AppBarItems.anonimAppBarItems.keys.elementAt(index),
              selected: provider.currentIndex == index,
              size: size,
              sizeBase: AppBarItems.anonimAppBarItems.length,
              index: index,
              provider: provider,
            ),
          );
        },
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
  final AnonimAppBarProvider provider;

  _TabItem({
    required this.label,
    required this.selected,
    required this.size,
    required this.sizeBase,
    required this.index,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final radius = AppStyles.anonimTabBarSelectedItemRadius;

    return Card(
      margin: EdgeInsets.all(0.0),
      elevation: 0.0,
      color: !selected ? Colors.black : Colors.transparent,
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
