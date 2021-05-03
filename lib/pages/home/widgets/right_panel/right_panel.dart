import 'package:flutter/material.dart';
import 'package:home_githubio/core/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/core/styles/app_colors.dart';
import 'package:provider/provider.dart';

import 'widgets/anonim_app_bar/anonim_app_bar.dart';
import 'widgets/anonim_app_bar/app_bar_items.dart';

Map<String, Widget> _appBarItems = AppBarItems.anonimAppBarItems;

class RightPanel extends StatelessWidget {
  final Size size;

  const RightPanel({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Usando o provider da barra customizada aqui
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);

    return Expanded(
      child: Scaffold(
        ///* Impede que uma fina linha vertical apareça no lado esquerdo da AnonimAppBar
        ///* durante a animação do AnimatedContainer() que contém os projetos
        backgroundColor: AppColors.black,
        appBar: AnonimAppBar(
          provider: provider,
          items: _appBarItems,
        ),
        body: AnimatedContainer(
          duration: Duration(milliseconds: 450),
          curve: Curves.easeInOutCirc.flipped,
          color: Colors.black,
          width: provider.selectedTab == 'Projects'
              ? size.width * .8
              : size.width * .5,
          child: _BodyRight(),
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
    final Color topShadowColor = AppColors.white;

    return Stack(
      children: [
        // Body content
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: provider.selectedTab == 'Projects' ||
                      provider.currentIndex != _appBarItems.length
                  ? Radius.circular(40.0)
                  : Radius.circular(0.0),
            ),
          ),
          margin: EdgeInsets.all(0.0),
          elevation: 0.0,
          color: Colors.white,
          child: IndexedStack(
            alignment: Alignment.center,
            index: provider.currentIndex,
            children: AppBarItems.anonimAppBarItems.values.toList(),
          ),
        ),
        // Gradient
        if (provider.selectedTab == 'About')
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.spotlight,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  topShadowColor,
                  topShadowColor.withOpacity(0),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
