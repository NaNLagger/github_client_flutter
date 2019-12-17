import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:github_client_flutter/search/action.dart';
import 'action.dart';
import 'state.dart';
import 'package:github_client_flutter/base/builders.dart' as builders;

class MainViewBuilder extends builders.ViewBuilder<MainState> {
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(MainState state, Dispatch dispatch, ViewService viewService) {
    final searchWidget = viewService.buildComponent('search');
    final pagingWidget = viewService.buildComponent('paging');

    if(state.error != null) {
      final snackBar = SnackBar(content: Text("${state.error.toString()}"));
      _key.currentState.showSnackBar(snackBar);
      dispatch(MainActionsCreate.error(null));
    }
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: _getTitle(state, searchWidget),
        actions: <Widget>[
          IconButton(
            icon: _getIconAction(state),
            onPressed: () {
              dispatch(ActionsCreate.clickIcon());
            },
          )
        ],
      ),
      body: pagingWidget,
    );
  }

  Widget _getIconAction(MainState state) {
    if (state.searchState.isExpanded) {
      return Icon(Icons.clear);
    } else {
      return Icon(Icons.search);
    }
  }

  Widget _getTitle(MainState state, Widget searchWidget) {
    if (!state.searchState.isExpanded) {
      return Text("Repositories");
    } else {
      return searchWidget;
    }
  }
}
