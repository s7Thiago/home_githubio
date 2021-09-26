import 'package:flutter/material.dart';
import 'package:home_githubio/app/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/app/styles/styles.dart';
import 'package:home_githubio/app/utils/responsive.dart';
import 'package:home_githubio/app/values.dart';
import 'package:home_githubio/pages/home/widgets/right_panel/widgets/anonim_app_bar/app_bar_items.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatelessWidget {
  final Size size;

  const LeftPanel({key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);
    final responsive = AppResponsively(context);
    final duration = Duration(milliseconds: 450);
    final curve = Curves.easeInOutQuint;

    return Material(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOutCirc.flipped,
        width: provider.selectedTab == AppBarItems.PROJECT
            ? size.width * .2
            : size.width * (responsive.isTablet() ? .35 : .5),
        color: Colors.black,
        child: AnimatedOpacity(
          opacity: provider.selectedTab == AppBarItems.PROJECT ? .2 : 1,
          duration: Duration(milliseconds: 350),
          curve: curve,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/profile-photo-front-art-thiago.png',
                scale: 4.3,
              ),
              AnimatedScale(
                scale: provider.selectedTab == AppBarItems.PROJECT ? .75 : 1,
                duration: duration,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: AppValues.desc1.toUpperCase(),
                            style: AppStyles.description1TextStyle,
                          ),
                          TextSpan(
                            text: ' ' + AppValues.name.toUpperCase(),
                            style: AppStyles.nameTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      AppValues.desc2,
                      style: AppStyles.description2TextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              Container(
                height: 200,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom: 50),
                child: AnimatedScale(
                  scale: provider.selectedTab == AppBarItems.PROJECT ? .7 : .5,
                  curve: curve,
                  duration: duration,
                  child: Image.asset(
                    'assets/images/skills/main/main_skills.png',
                    fit: BoxFit.cover,
                    // scale: 6,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
