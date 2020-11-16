import 'package:flutter/material.dart';
import 'package:home_githubio/app/routes.dart';
import 'package:home_githubio/views/home.dart';

void main() {
  runApp(AnonimApp());
}

class AnonimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {AppRoutes.HOME: (_) => HomeView()},
    );
  }
}
