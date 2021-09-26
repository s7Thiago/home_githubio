import 'package:home_githubio/model/project.dart';
import 'package:home_githubio/repositories/projects_repository.dart';

import './projects_service.dart';

class ProjectsServiceImpl implements ProjectsService {
  final ProjectsRepository _repository;

  ProjectsServiceImpl({required ProjectsRepository repository})
      : _repository = repository;

  @override
  Future<List<Project>> getAllProjects() => _repository.getAllProjects();

  @override
  Future<List<Project>> getShowcaseProjects() =>
      _repository.getShowcaseProjects();

  dynamic teste() => _repository.teste();
}
