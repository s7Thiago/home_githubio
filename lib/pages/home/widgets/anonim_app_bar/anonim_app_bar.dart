import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/core/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/core/styles/app_colors.dart';
import 'package:home_githubio/core/styles/styles.dart';
import 'package:home_githubio/pages/home/widgets/anonim_app_bar/app_bar_items.dart';

class AnonimAppBar extends PreferredSize {
  AnonimAppBar(
      {required AnonimAppBarProvider provider,
      required Map<String, Widget> items})
      : super(
          preferredSize: Size.fromHeight(100),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppColors.black,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    reverse: true,
                    itemCount: items.length,
                    itemBuilder: (context, index) => _TabItem(
                      label: items.keys.elementAt(index),
                      selected: provider.currentIndex == index,
                      index: index,
                      provider: provider,
                      itemsCountBaseSize: items.length,
                      onTap: () {
                        provider.updateIndex = index;
                        provider.updateSelectedTab = AppBarItems
                            .anonimAppBarItems.keys
                            .elementAt(provider.currentIndex);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
}

class _TabItem extends StatelessWidget {
  final String label;
  final bool selected;
  final index;
  final VoidCallback onTap;
  final AnonimAppBarProvider provider;
  final itemsCountBaseSize;

  _TabItem({
    required this.label,
    required this.selected,
    required this.index,
    required this.provider,
    required this.onTap,
    required this.itemsCountBaseSize,
  });
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final radius = AppStyles.anonimTabBarSelectedItemRadius;

    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        // * Cor que causa a impressão de continuidade com a borda arredondada do container lateral não selecionado
        color: Colors.white,
        child: Card(
          margin: EdgeInsets.all(0.0),
          elevation: 0.0,
          color: !selected ? AppColors.black : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: !selected
                  ? (index == provider.currentIndex - 1
                      ? Radius.circular(radius)
                      : Radius.circular(0))
                  : Radius.circular(0.0),
              bottomRight: !selected
                  ? (index == provider.currentIndex + 1
                      ? Radius.circular(radius)
                      : Radius.circular(0))
                  : Radius.circular(0.0),
            ),
          ),
          child: Container(
            // the width adapts automatically based on quantity of itens on anonimTabBarItems map
            width: ((size.width * .5) / itemsCountBaseSize),
            height: 30,
            // margin: const EdgeInsets.only(right: 15),

            child: Center(
              child: AnimatedDefaultTextStyle(
                style: selected
                    ? AppStyles.selectItemLabel
                    : AppStyles.normalItemLabel.copyWith(fontSize: 14),
                duration: Duration(milliseconds: 350),
                curve: Curves.easeInOutQuad,
                child: Text(
                  label,
                ),
              ),
            ),
            decoration:
                selected ? AppStyles.selectedTabItem : AppStyles.normalTabItem,
          ),
        ),
      ),
    );
  }
}
