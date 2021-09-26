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
    List<Project> results = <Project>[];

    // ? Estratégia para pegar os dados de outras páginas e unir
    var pagesCount = (userInfo.data['public_repos'] / 30).ceil();
    print('\n\npages count: ${pagesCount}');

    for (int i = 0; i < pagesCount; i++) {
      var response = await _githubRestClient.getResponse('/repos?page=${i}');

      response.data.map(
        (info) async {
          // print('\n\n${await info['name']}');
          results.add(
            Project(
              heading: info['language'] ?? '',
              title: info['name'] ?? '',
              description: info['description'] ?? 'Sem descrição',
              url: info['html_url'] ?? '',
            ),
          );
        },
      ).toList();
    }

    return Future.value(results);
  }

  @override
  Future<List<Project>> getShowcaseProjects() {
    throw UnimplementedError();
  }

  @override
  dynamic teste() async {}
}
