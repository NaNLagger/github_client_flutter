import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/github/domain/model.dart';

class DetailsState implements Cloneable<DetailsState> {
  DetailsState(this.fullName);

  final String fullName;
  RepositoryModel repositoryModel;
  bool loading = false;

  @override
  DetailsState clone() {
    return DetailsState(fullName)
      ..repositoryModel = repositoryModel
      ..loading = loading;
  }
}
