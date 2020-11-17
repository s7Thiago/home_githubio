import 'package:flutter/material.dart';
import 'package:home_githubio/views/about_section.dart';
import 'package:home_githubio/views/contact_section.dart';
import 'package:home_githubio/views/projects_section.dart';

class MenuItems {
  static final anonimTabBarItems = {
    'About': AboutSection(),
    'Projects': ProjectsSection(),
    'Contact': ContactSection(),
  };
}
