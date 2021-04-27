import 'package:flutter/material.dart';
import 'package:home_githubio/core/styles/styles.dart';
import 'package:home_githubio/core/values.dart';
import 'package:home_githubio/core/providers/anonim_app_bar_provider.dart';
import 'package:provider/provider.dart';

class LeftPanel extends StatelessWidget {
  final Size size;

  const LeftPanel({key, @required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AnonimAppBarProvider>(context, listen: true);

    return AnimatedContainer(
      duration: Duration(milliseconds: 450),
      curve: Curves.easeInOutCirc.flipped,
      width: provider.selectedTab == 'Projects'
          ? size.width * .2
          : size.width * .5,
      color: Colors.black,
      child: AnimatedOpacity(
        opacity: provider.selectedTab == 'Projects' ? .2 : 1,
        duration: Duration(milliseconds: 350),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/profile-photo-front-art-thiago.png',
              scale: 4.3,
            ),
            Column(
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
          ],
        ),
      ),
    );
  }
}
