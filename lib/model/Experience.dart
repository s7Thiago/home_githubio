import 'package:flutter/widgets.dart';

class Experience {
  final String title;
  final String description;
  final List<Widget> representations;

  Experience({
    this.title = '',
    this.description = '',
    this.representations = const [],
  });
}
