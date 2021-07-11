import 'package:flutter/material.dart';

class Education {
  final String? content;
  final String? subContentTitle;
  final String? subContentText;
  Widget? trailing;
  Widget? leading;

  Education({
    this.subContentTitle,
    this.subContentText,
    this.content,
    this.trailing,
    this.leading,
  });
}
