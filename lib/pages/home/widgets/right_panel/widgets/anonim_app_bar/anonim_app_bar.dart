import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_githubio/app/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/app/styles/app_colors.dart';
import 'package:home_githubio/app/styles/styles.dart';
import 'package:home_githubio/app/utils/responsive.dart';

class AnonimAppBar extends PreferredSize {
  AnonimAppBar(
      {required AnonimAppBarProvider provider,
      required Map<String, Widget> items})
      : super(
          preferredSize: Size.fromHeight(95),
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
                      label: items.keys.elementAt(index).toString(),
                      selected: provider.currentIndex == index,
                      index: index,
                      provider: provider,
                      itemsCountBaseSize: items.length,
                      onTap: () {
                        provider.updateIndex = index;
                        provider.updateSelectedTab = items.keys
                            .elementAt(provider.currentIndex)
                            .toString();
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
    final responsive = AppResponsively(context);

    return InkWell(
      onTap: this.onTap,
      mouseCursor: MaterialStateProperty.resolveAs<MouseCursor?>(
        MaterialStateMouseCursor.clickable,
        {},
      ),
      child: Container(
        // * Cor que causa a impressão de continuidade com a borda arredondada do container lateral não selecionado
        color: Colors.white,
        child: Card(
          margin: EdgeInsets.all(0.0),
          elevation: 0.0,
          color: !selected ? AppColors.black : AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: responsive.isMobile()
                  ? Radius.circular(0)
                  : (!selected
                      ? (index == provider.currentIndex - 1
                          ? Radius.circular(radius)
                          : Radius.circular(0))
                      : Radius.circular(0.0)),
              bottomRight: responsive.isMobile()
                  ? Radius.circular(0)
                  : (!selected
                      ? (index == provider.currentIndex + 1
                          ? Radius.circular(radius)
                          : Radius.circular(0))
                      : Radius.circular(0.0)),
              topLeft: !responsive.isMobile()
                  ? Radius.circular(0)
                  : (!selected
                      ? (index == provider.currentIndex - 1
                          ? Radius.circular(radius)
                          : Radius.circular(0))
                      : Radius.circular(0.0)),
              topRight: !responsive.isMobile()
                  ? Radius.circular(0)
                  : (!selected
                      ? (index == provider.currentIndex + 1
                          ? Radius.circular(radius)
                          : Radius.circular(0))
                      : Radius.circular(0.0)),
            ),
          ),
          child: Container(
            // the width adapts automatically based on quantity of itens on anonimTabBarItems map
            width: ((size.width *
                    (responsive.isMobile()
                        ? 1
                        : (responsive.isTablet() ? .65 : .5))) /
                itemsCountBaseSize),
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
