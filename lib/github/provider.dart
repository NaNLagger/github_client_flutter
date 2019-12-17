import 'package:github_client_flutter/github/data/api.dart';
import 'package:github_client_flutter/github/data/mapper.dart';
import 'package:github_client_flutter/github/data/repository.dart';
import 'package:github_client_flutter/github/domain/interactor.dart';

class Provider {

  static Api provideApi() {
    return Api();
  }

  static RepositoryMapper provideRepositoryMapper() {
    return RepositoryMapper(provideUserMapper());
  }

  static UserMapper provideUserMapper() {
    return UserMapper();
  }

  static GithubRepository provideGithubRepository() {
    return GithubRepository(provideApi(), provideRepositoryMapper());
  }

  static GithubInteractor provideGithubInteractor() {
    return GithubInteractor(provideGithubRepository());
  }
}