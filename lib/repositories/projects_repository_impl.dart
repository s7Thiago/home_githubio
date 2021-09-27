import 'package:home_githubio/app/github_rest_client.dart';
import 'package:home_githubio/model/project.dart';

import './projects_repository.dart';

class ProjectsRepositoryImpl implements ProjectsRepository {
  final GithubRestClient _githubRestClient;

  ProjectsRepositoryImpl({required GithubRestClient githubRestClient})
      : _githubRestClient = githubRestClient;

  @override
  Future<List<Project>> getAllProjects() async {
    var userInfo = await _githubRestClient.getResponse('');
    List<Project> result = <Project>[];
    Map<int, Project> projects = <int, Project>{};

    // ? Estratégia para pegar os dados de outras páginas e unir
    var pagesCount = (userInfo.data['public_repos'] / 30).ceil();
    // print('\n\npages count: ${pagesCount}');

    for (int i = 0; i < pagesCount; i++) {
      var response = await _githubRestClient.getResponse('/repos?page=${i}');

      response.data.map(
        (info) async {
          // Convertendo os objetos da API para o modelo Project
          var project = Project.fromMap(info);

          // Removendo o marcador da descrição que será exibida na interface
          // var newDesc = project.description.replaceAll('[x]', '');

          // * Não adiciona, se já existe um projeto com o mesmo nome
          int qtdeSameTitle =
              result.where((p) => p.title == project.title).length;

          // print('same title count: ${qtdeSameTitle}');

          result.add(project);
        },
      ).toList();
    }

    // ? Filtrando apenas os repositórios marcados com [x]
    result =
        result.where((project) => project.description.contains('[x]')).toList();

    // ? mapeando os projetos de modo que o id de cada um seja a chave
    projects = {for (var p in result) p.id: p};
    // print('Projects: ${projects.entries.length}');

    // ? atribuindo os projetos mapeados ao resultado
    result = projects.values.toList();

    // ? ordenando a lista
    result.sort(
      (a, b) {
        return DateTime.parse(a.updatedAt)
            .difference(DateTime.parse(b.updatedAt))
            .inDays;
      },
    );

    // print('Size before clean: ${result.length}');

    // ! Removendo todos os elementos que já existem
    // for (Project project in result) {
    //   // var qtdeSameId = 0;
    //   for (Project b in result) {
    //     result.removeWhere((p) => (b.id == project.id) && p.id == b.id);
    //   }
    //   print('pId: ${project.id}');
    // }

    // print('Size after clean: ${result.length}');

    return Future.value(result.reversed.toList());
  }

  @override
  Future<List<Project>> getShowcaseProjects() {
    throw UnimplementedError();
  }

  @override
  dynamic teste() async {}
}
