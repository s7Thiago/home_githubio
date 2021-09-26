import 'package:flutter/material.dart';
import 'package:home_githubio/app/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/app/styles/app_colors.dart';
import 'package:home_githubio/app/utils/responsive.dart';
import 'package:provider/provider.dart';

import 'widgets/anonim_app_bar/anonim_app_bar.dart';
import 'widgets/anonim_app_bar/app_bar_items.dart';

class RightPanel extends StatelessWidget {
  final Size size;

  const RightPanel({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Usando o provider da barra customizada aqui
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);
    final responsive = AppResponsively(context);
    final appBarItems = AppBarItems(context: context);

    Map<String, Widget> _appBarItems = appBarItems.items;

    return Scaffold(
      ///* Impede que uma fina linha vertical apareça no lado esquerdo da AnonimAppBar
      ///* durante a animação do AnimatedContainer() que contém os projetos
      backgroundColor: AppColors.black,
      appBar: responsive.isMobile()
          ? null
          : AnonimAppBar(
              provider: provider,
              items: _appBarItems,
            ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 450),
        curve: Curves.easeInOutCirc.flipped,
        color: Colors.black,
        width: responsive.isMobile()
            ? double.maxFinite
            : (provider.selectedTab == AppBarItems.PROJECT
                ? size.width * (responsive.isTablet() ? 1 : .8)
                : size.width * (responsive.isTablet() ? .65 : .5)),
        child: Stack(
          children: [
            _BodyRight(_appBarItems),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.white,
                      Colors.white.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: responsive.isMobile()
          ? SizedBox(
              height: 100,
              child: AnonimAppBar(
                provider: provider,
                items: _appBarItems,
              ),
            )
          : null,
    );
  }
}

class _BodyRight extends StatelessWidget {
  final Map<String, Widget> _appBarItems;

  _BodyRight(this._appBarItems);

  @override
  Widget build(BuildContext context) {
    // * Usando o provider da barra customizada aqui
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);
    final Color topShadowColor = AppColors.white;
    final responsive = AppResponsively(context);

    return Stack(
      children: [
        // Body content
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: !responsive.isMobile()
                  ? (provider.selectedTab == AppBarItems.PROJECT ||
                          provider.currentIndex != _appBarItems.length
                      ? Radius.circular(40.0)
                      : Radius.circular(0.0))
                  : Radius.circular(0),
            ),
          ),
          margin: EdgeInsets.all(0.0),
          elevation: 0.0,
          color: Colors.white,
          child: IndexedStack(
            alignment: Alignment.center,
            index: provider.currentIndex,
            children: _appBarItems.values.toList(),
          ),
        ),
        // Gradient
        if (provider.selectedTab == AppBarItems.ABOUT)
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
