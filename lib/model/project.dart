import 'dart:convert';

class Project {
  final String heading;
  final String title;
  final String description;
  final String footer;
  final String url;

  // All args constructor
  Project({
    required this.heading,
    required this.title,
    required this.description,
    this.footer = 'see on github',
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'heading': heading,
      'title': title,
      'description': description,
      'footer': footer,
      'url': url,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      heading: map['heading'],
      title: map['title'],
      description: map['description'],
      footer: map['footer'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source));
}
