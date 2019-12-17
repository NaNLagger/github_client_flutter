import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/base/builders.dart';
import 'package:github_client_flutter/main/presentation/action.dart';
import 'package:github_client_flutter/main/presentation/state.dart';
import 'package:github_client_flutter/paging/action.dart';
import 'package:github_client_flutter/search/action.dart';

class MainReducerBuilder extends ReducerBuilder<MainState> {
  @override
  Reducer<MainState> build() {
    return asReducer({
      Actions.submit: _submit,
      PagingListAction.loadItems: _loaded,
      PagingListAction.refresh: _refresh,
      MainActions.error: _error
    });
  }

  MainState _submit(MainState state, Action action) {
    var pagingState = state.pagingListState.clone()
      ..isRetry = false
      ..loading = true;
    return state.clone()
      ..pagingListState = pagingState
      ..query = action.payload as String
      ..loadedPage = 0;
  }

  MainState _refresh(MainState state, Action action) {
    return state.clone()..loadedPage = 0;
  }

  MainState _loaded(MainState state, Action action) {
    return state.clone()..loadedPage = state.loadedPage + 1;
  }

  MainState _error(MainState state, Action action) {
    var error = (action.payload as Exception);
    var pagingState = state.pagingListState.clone()
      ..isRetry = true
      ..loading = false
      ..loadingComplete = true
      ..loadingMore = false;
    return state.clone()
      ..error = error
      ..pagingListState = pagingState;
  }
}
