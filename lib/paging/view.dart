import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:fish_redux/src/redux_component/basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:github_client_flutter/base/builders.dart' as builders;
import 'package:github_client_flutter/paging/action.dart';
import 'package:github_client_flutter/paging/state.dart';

class PagingListViewBuilder extends builders.ViewBuilder<PagingListState> {
  ScrollController _scrollController = ScrollController();
  VoidCallback _scrollListener;
  Completer loadingCompleter = Completer();
  GlobalKey<RefreshIndicatorState> _refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(PagingListState state, dispatch, ViewService viewService) {
    final adapter = viewService.buildAdapter();

    _scrollController.removeListener(_scrollListener);
    _scrollListener = _buildScrollListener(dispatch);
    if(!state.isRetry && !state.loadingComplete && !state.loadingMore) {
      _scrollController.addListener(_scrollListener);
    }

    if(!state.loading && !loadingCompleter.isCompleted) {
      loadingCompleter.complete();
    }
    if(state.loading && loadingCompleter.isCompleted) {
      _refreshKey.currentState.show();
    }

    return RefreshIndicator(
      key: _refreshKey,
      onRefresh: () async {
        if(!state.loading) dispatch(PagingListActionCreate.refresh());
        loadingCompleter = Completer();
        await loadingCompleter.future;
      },
      child: _getBody(adapter, state, dispatch),
    );
  }

  Widget _getBody(ListAdapter adapter, PagingListState state, Dispatch dispatch) {
    return ListView.builder(
        controller: _scrollController,
        itemCount: _getItemCount(state),
        itemBuilder: (BuildContext context, int position) {
          return GestureDetector(
            child: _getRow(state, position, adapter, context, dispatch),
            onTap: () {
              dispatch(PagingListActionCreate.clickItem(state.items[position]));
            },
          );
        });
  }

  int _getItemCount(PagingListState state) {
    if (state.loadingMore || state.isRetry) {
      return state.items.length + 1;
    } else {
      return state.items.length;
    }
  }

  Widget _getRow(PagingListState state, int position, ListAdapter adapter, BuildContext context, Dispatch dispatch) {
    if (state.items.length == position) {
      Widget footer;
      if(state.loadingMore) {
        footer = CircularProgressIndicator();
      } else {
        footer = GestureDetector(
          child: Text("Retry"),
          onTap: () {
            dispatch(PagingListActionCreate.loadMore());
          },
        );
      }
      return Container(
        margin: const EdgeInsets.all(30.0),
        child: Center(child: footer),
      );
    } else {
      return adapter.itemBuilder(context, position);
    }
  }

  _buildScrollListener(Dispatch dispatch) {
    return () {
      if (_scrollController.position.maxScrollExtent <
          _scrollController.offset + 300) {
        dispatch(PagingListActionCreate.loadMore());
      }
    };
  }
}