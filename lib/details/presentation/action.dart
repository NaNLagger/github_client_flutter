import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/github/domain/model.dart';

enum DetailsActions { loaded }
class DetailsActionCreate {
  static Action loaded(RepositoryModel model) => Action(DetailsActions.loaded, payload: model);
}