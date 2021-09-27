import 'package:flutter/cupertino.dart';
import 'package:home_githubio/app/providers/anonim_app_bar_provider.dart';
import 'package:provider/provider.dart';

class AppBarItems {
  static const CONTACT = 'contact';
  static const PROJECT = 'Projects';
  static const ABOUT = 'About';
  final BuildContext context;

  AppBarItems({required this.context});

  Map<String, Widget> get items => {
        AppBarItems.CONTACT:
            Provider.of<AnonimAppBarProvider>(context).contactView,
        AppBarItems.PROJECT:
            Provider.of<AnonimAppBarProvider>(context).projectsView,
        AppBarItems.ABOUT: Provider.of<AnonimAppBarProvider>(context).aboutView,
      };
}
