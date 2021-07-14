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
}
