import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/github/domain/model.dart';

enum MainActions {loadMoreForReducer, error }
class MainActionsCreate {
  static Action loadMoreForReducer() => const Action(MainActions.loadMoreForReducer);
  static Action error(Exception exception) => Action(MainActions.error, payload: exception);
}