import 'package:home_githubio/model/project.dart';

abstract class ProjectsRepository {
  Future<List<Project>> getAllProjects();
  Future<List<Project>> getShowcaseProjects();
  dynamic teste();
}
