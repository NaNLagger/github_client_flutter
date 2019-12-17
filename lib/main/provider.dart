import 'package:github_client_flutter/github/provider.dart';
import 'package:github_client_flutter/main/repository_item/adapter.dart';
import 'package:github_client_flutter/paging/component.dart';
import 'package:github_client_flutter/paging/provider.dart';
import 'presentation/reducer.dart';
import 'presentation/effect.dart';
import 'presentation/view.dart';

class MainProvider {
  static MainEffectBuilder provideMainEffectBuilder() {
    return MainEffectBuilder(Provider.provideGithubInteractor());
  }

  static MainReducerBuilder provideMainReducerBuilder() {
    return MainReducerBuilder();
  }

  static MainViewBuilder provideMainViewBuilder() {
    return MainViewBuilder();
  }

  static RepositoryItemListAdapter provideRepositoryItemListAdapter() {
    return RepositoryItemListAdapter();
  }

  static PagingComponent providePagingComponent() {
    return PagingComponent(
        PagingProvider.providePagingListViewBuilder(),
        PagingProvider.providePagingListReducerBuilder(),
        provideRepositoryItemListAdapter());
  }
}
