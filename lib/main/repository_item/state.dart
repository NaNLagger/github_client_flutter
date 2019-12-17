import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/github/domain/model.dart';

class RepositoryItemState extends Cloneable<RepositoryItemState> {
  RepositoryModel repositoryModel = RepositoryModel("", UserModel(0, "", ""), "", "");

  @override
  RepositoryItemState clone() {
    return RepositoryItemState()..repositoryModel = repositoryModel;
  }
}
