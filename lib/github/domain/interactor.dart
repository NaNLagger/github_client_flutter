import 'package:github_client_flutter/github/data/repository.dart';

import 'model.dart';

class GithubInteractor {
  GithubInteractor(this._repository);

  final GithubRepository _repository;

  Future<List<RepositoryModel>> searchRepositories(
          String query, String sort, String order, int page, int perPage) =>
      _repository.searchRepositories(query, sort, order, page, perPage);

  Future<RepositoryModel> getRepository(String fullName) => _repository.getRepository(fullName);
}
