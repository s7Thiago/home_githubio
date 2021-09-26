import 'dart:convert';

class Project {
  final int id;
  final String heading;
  final String title;
  final String description;
  final String footer;
  final String url;
  final String updatedAt;

  // All args constructor
  Project({
    this.id = 0,
    required this.heading,
    required this.title,
    required this.description,
    this.footer = 'see on github',
    required this.url,
    this.updatedAt = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'heading': heading,
      'title': title,
      'description': description,
      'footer': footer,
      'url': url,
      'updatedAt': updatedAt,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      id: map['id'],
      heading: map['language'] ?? '',
      title: map['name'] ?? '',
      description: map['description'] ?? '',
      // footer: map['footer'],
      url: map['html_url'] ?? '',
      updatedAt: map['created_at'] ?? '2017-01-01T18:18:30Z',
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source));

  Project copyWith({
    int? id,
    String? heading,
    String? title,
    String? description,
    String? footer,
    String? url,
    String? updatedAt,
  }) {
    return Project(
      id: id ?? this.id,
      heading: heading ?? this.heading,
      title: title ?? this.title,
      description: description ?? this.description,
      footer: footer ?? this.footer,
      url: url ?? this.url,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
