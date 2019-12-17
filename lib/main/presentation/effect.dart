import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' as flutter;
import 'package:github_client_flutter/base/builders.dart';
import 'package:github_client_flutter/github/domain/interactor.dart';
import 'package:github_client_flutter/github/domain/model.dart';
import 'package:github_client_flutter/main/presentation/state.dart';
import 'package:github_client_flutter/main/repository_item/state.dart';
import 'package:github_client_flutter/paging/action.dart';
import 'package:github_client_flutter/search/action.dart';

import 'action.dart';

class MainEffectBuilder extends EffectBuilder<MainState> {
  MainEffectBuilder(this._interactor);

  final GithubInteractor _interactor;

  @override
  Effect<MainState> build() {
    return combineEffects({
      Actions.submit: _loadItems,
      PagingListAction.refresh: _loadItems,
      PagingListAction.clickItem: _openDetailsPage,
      PagingListAction.loadMore: _loadItems,
    });
  }

  Future<void> _loadItems(Action action, Context<MainState> context) async {
    var query;
    if (action.type == Actions.submit) {
      query = action.payload as String;
    } else {
      query = context.state.query;
    }
    try {
      var isRefresh = (action.type == Actions.submit || action.type == PagingListAction.refresh);
      var page = context.state.loadedPage + 1;
      if(isRefresh) {
        page = 1;
      }
      var searchResponse = await _interactor.searchRepositories(
          query, "", "desc", page, 20);
      var list = searchResponse.map((it) {
        return RepositoryItemState()
          ..repositoryModel = it;
      }).toList();
      context.dispatch(PagingListActionCreate.loadItems(
          isRefresh, list, searchResponse.isEmpty));
    } on Exception catch (error) {
      context.dispatch(MainActionsCreate.error(error));
    }
  }

  _openDetailsPage(Action action, Context<MainState> context) {
    flutter.Navigator.of(context.context).pushNamed('details',
        arguments: (action.payload as RepositoryItemState).repositoryModel.fullName);
  }
}
