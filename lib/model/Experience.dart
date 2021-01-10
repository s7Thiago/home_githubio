import 'package:flutter/widgets.dart';

class Experience {
  final String title;
  final String description;
  final List<Widget> representations;

  Experience({
    @required this.title,
    @required this.description,
    @required this.representations,
  });
}
