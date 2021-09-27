import 'package:flutter/cupertino.dart';
import 'package:home_githubio/model/project.dart';
import 'package:home_githubio/services/projects_service.dart';

class ProjectsController extends ChangeNotifier {
  List<Project>? _projects = null;

  ProjectsService _projectsService;

  ProjectsController({required ProjectsService projectsService})
      : _projectsService = projectsService;

  Future<List<Project>> get projects async {
    // Verifica se a lista de projetos já foi carregada
    if (_projects != null) {
      if (!_projects!.isEmpty) {
        print('projetos do já carregados: $_projects');
        return Future.value(_projects!);
      } else {
        // a lista não é nula mas está vazia. Nesse caso, aciona o serviço para
        // carregar os dados
        print('sem projetos. Carregando: $_projects');
        _projects = await _projectsService.getAllProjects();
        return _projects!;
      }
    } else {
      print('lista nula. inserindo projetos  projetos: $_projects');
      _projects = await _projectsService.getAllProjects();
      return _projects!;
    }
  }
}
