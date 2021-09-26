import 'package:flutter/material.dart';
import 'package:home_githubio/app/providers/anonim_app_bar_provider.dart';
import 'package:home_githubio/app/utils/responsive.dart';
import 'package:home_githubio/pages/home/widgets/left_panel/left_panel.dart';
import 'package:home_githubio/pages/home/widgets/right_panel/right_panel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final responsive = AppResponsively(context);

    return ChangeNotifierProvider(
      create: (_) => AnonimAppBarProvider(),
      child: responsive.isMobile()
          ? RightPanel(size: size)
          : Row(
              children: [
                LeftPanel(size: size),
                Expanded(child: RightPanel(size: size)),
              ],
            ),
    );
  }
}
