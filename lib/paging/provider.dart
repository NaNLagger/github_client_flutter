import 'package:github_client_flutter/paging/reducer.dart';
import 'package:github_client_flutter/paging/view.dart';

class PagingProvider {
  static PagingListViewBuilder providePagingListViewBuilder() {
    return PagingListViewBuilder();
  }

  static PagingListReducerBuilder providePagingListReducerBuilder() {
    return PagingListReducerBuilder();
  }
}