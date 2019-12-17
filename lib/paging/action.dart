import 'package:fish_redux/fish_redux.dart';

enum PagingListAction { refresh, loadItems, loadMore, error, clickItem }

class PagingListActionCreate {
  static Action refresh() => const Action(PagingListAction.refresh);

  static Action loadItems(bool refresh, List<dynamic> items, bool completed) =>
      Action(PagingListAction.loadItems,
          payload: LoadItemsPayload(refresh, items, completed));

  static Action loadMore() => const Action(PagingListAction.loadMore);

  static Action error() => const Action(PagingListAction.error);

  static Action clickItem(item) => Action(PagingListAction.clickItem, payload: item);
}

class LoadItemsPayload {
  LoadItemsPayload(this.refresh, this.items, this.completed);

  bool refresh;
  List<dynamic> items;
  bool completed;
}
