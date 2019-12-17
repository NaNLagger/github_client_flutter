import 'package:fish_redux/fish_redux.dart';
import 'package:github_client_flutter/main/repository_item/view.dart';
import 'package:github_client_flutter/paging/state.dart';

import 'component.dart';

class RepositoryItemListAdapter extends SourceFlowAdapter<PagingListState> {
  RepositoryItemListAdapter()
      : super(
    pool: <String, Component<Object>>{
      'repositoryItem': RepositoryItemComponent(RepositoryItemViewBuilder()),
    },
  );
}