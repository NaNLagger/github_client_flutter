import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/github/domain/model.dart';
import 'package:github_client_flutter/paging/state.dart';
import 'package:github_client_flutter/search/state.dart';

class MainState implements Cloneable<MainState> {
  SearchState searchState = SearchState();
  PagingListState pagingListState = PagingListState();
  int loadedPage = 0;
  String query = "";
  Exception error;

  @override
  MainState clone() {
    return MainState()
      ..query = query
      ..searchState = searchState
      ..pagingListState = pagingListState
      ..loadedPage = loadedPage
      ..error = error;
  }
}

class SearchConnector extends ConnOp<MainState, SearchState> {
  @override
  SearchState get(MainState state) => state.searchState;

  //Этот метод будет вызываться при изменении состояния дочернего компонента.
  @override
  void set(MainState state, SearchState subState) =>
      state.searchState = subState;
}

class PagingConnector extends ConnOp<MainState, PagingListState> {
  @override
  PagingListState get(MainState state) => state.pagingListState;

  @override
  void set(MainState state, PagingListState subState) {
    state.pagingListState = subState;
  }
}
