import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/base/builders.dart';
import 'package:github_client_flutter/paging/action.dart';
import 'package:github_client_flutter/paging/state.dart';

class PagingListReducerBuilder extends ReducerBuilder<PagingListState> {
  @override
  Reducer<PagingListState> build() {
    return asReducer({
      PagingListAction.refresh: _refresh,
      PagingListAction.loadItems: _loadItems,
      PagingListAction.loadMore: _loadingMore,
      PagingListAction.error: _error
    });
  }

  PagingListState _refresh(PagingListState state, Action action) {
    return state.clone()
        ..loading = true
        ..loadingMore = false
        ..isRetry = false
        ..loadingComplete = false;
  }

  PagingListState _loadItems(PagingListState state, Action action) {
    LoadItemsPayload payload = action.payload as LoadItemsPayload;
    var nItems = state.items;
    if(payload.refresh) {
      nItems.clear();
    }
    nItems.addAll(payload.items);
    return state.clone()
        ..loading = false
        ..loadingMore = false
        ..items = nItems
        ..loadingComplete = payload.completed;
  }

  PagingListState _error(PagingListState state, Action action) {
    return state.clone()
        ..loading = false
        ..loadingMore = false
        ..loadingComplete = true;
  }

  PagingListState _loadingMore(PagingListState state, Action action) {
    return state.clone()
        ..loadingMore = true
        ..isRetry = false;
  }
}