import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/base/builders.dart';
import 'package:github_client_flutter/details/presentation/action.dart';
import 'package:github_client_flutter/github/domain/model.dart';
import 'state.dart';

class DetailsReducerBuilder extends ReducerBuilder<DetailsState> {
  @override
  Reducer<DetailsState> build() {
    return asReducer({
      Lifecycle.initState: (state, action) => state.clone()..loading = true,
      DetailsActions.loaded: (state, action) => state.clone()
        ..repositoryModel = action.payload as RepositoryModel
        ..loading = false
    });
  }
}
