import 'package:github_client_flutter/github/data/mapper.dart';
import 'package:github_client_flutter/github/domain/model.dart';

import 'api.dart';

class GithubRepository {
  GithubRepository(this._api, this._repositoryMapper);

  final Api _api;
  final RepositoryMapper _repositoryMapper;

  Future<List<RepositoryModel>> searchRepositories(String query, String sort, String order, int page, int perPage) async {
    var response = await _api.searchRepositories(query, sort, order, page, perPage);
    return response.items.map((it) => _repositoryMapper.map(it)).toList();
  }

  Future<RepositoryModel> getRepository(String fullName) async {
    var response = await _api.getRepository(fullName);
    return _repositoryMapper.map(response);
  }
}