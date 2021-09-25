import 'package:flutter/material.dart';
import 'package:home_githubio/app/routes.dart';
import 'package:home_githubio/pages/home/home_page.dart';

void main() {
  runApp(AnonimApp());
}

class AnonimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.black,
      routes: {AppRoutes.HOME: (_) => HomePage()},
    );
  }
}
