import 'package:fish_redux/fish_redux.dart';

class PagingListState implements Cloneable<PagingListState>, ImmutableSource {

  bool loading = false;
  bool loadingMore = false;
  List<dynamic> items = List();
  bool isRetry = false;
  bool loadingComplete = false;

  @override
  PagingListState clone() {
    return PagingListState()
        ..loading = loading
        ..loadingMore = loadingMore
        ..items = items
        ..isRetry = isRetry
        ..loadingComplete = loadingComplete;
  }

  @override
  Object getItemData(int index) {
    return items[index];
  }

  @override
  String getItemType(int index) {
    return "repositoryItem";
  }

  @override
  // TODO: implement itemCount
  int get itemCount => items.length;

  @override
  ImmutableSource setItemData(int index, Object data) {
    items[index] = data;
    return this;
  }

  @override
  ImmutableSource updateItemData(int index, Object data, bool isStateCopied) {
    return this;
  }

}